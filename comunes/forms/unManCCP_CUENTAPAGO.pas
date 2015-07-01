unit unManCCP_CUENTAPAGO;

interface

{$IFDEF ART2}
  {$DEFINE ART1_TO_2}
{$ENDIF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, {unCustomGridABM, }FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, PatternEdit, unArt, Mask, unCustomConsulta, CheckLst,
  ARTCheckListBox, Buttons;

type
  TfrmManCCP_CUENTAPAGO = class(TfrmCustomConsulta)
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbAsignarConceptosPagos: TToolButton;
    fpAsignacionConceptosPago: TFormPanel;
    Bevel10: TBevel;
    spbAsignar: TSpeedButton;
    spbDesasignar: TSpeedButton;
    Label8: TLabel;
    Label10: TLabel;
    spbSelTodos: TSpeedButton;
    spbUnSelTodos: TSpeedButton;
    spbSelTodos2: TSpeedButton;
    spbUnSelTodos2: TSpeedButton;
    btnAsignarCP: TButton;
    btnCancelarAsigCP: TButton;
    clbConceptosSinAsignar: TARTCheckListBox;
    clbConceptosAsignados: TARTCheckListBox;
    btnCancelarCP: TButton;
    procedure FormCreate(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAsignarConceptosPagosClick(Sender: TObject);
    procedure spbSelTodosClick(Sender: TObject);
    procedure spbAsignarClick(Sender: TObject);
    procedure spbDesasignarClick(Sender: TObject);
    procedure clbConceptosSinAsignarDblClick(Sender: TObject);
    procedure clbConceptosAsignadosDblClick(Sender: TObject);
    procedure btnCancelarCPClick(Sender: TObject);
    procedure spbSelTodos2Click(Sender: TObject);
    procedure btnAsignarCPClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  protected
    procedure PrintResults; override;
  private
    FCuitCuil: String;
    FIdAcreedor: TTableId;
    FSoloOtrosBancos: Boolean;
    FTipoAcreedor: String;

    function GetSubTituloListado(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String): String;

    procedure DoCargarConceptosPago;
  public
    function Execute(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String; bSoloOtrosBancos: Boolean = False): Boolean;
  end;

implementation

{$R *.DFM}

uses
  VclExtra, unPrincipal, CustomDlgs, unDmPrincipal, AnsiSql, SqlFuncs, unAltaModifCCP_CUENTAPAGO, unSesion, General;

procedure TfrmManCCP_CUENTAPAGO.FormCreate(Sender: TObject);
begin
  inherited;

  // Seteos para RedPres
  {$IFDEF RED_PRES}
    ToolBar.Images    := frmPrincipal.imgGenBW;
    ToolBar.HotImages := frmPrincipal.imgGenColor;

    tbRefrescar.ImageIndex              := 4;
    tbNuevo.ImageIndex                  := 23;
    tbModificar.ImageIndex              := 24;
    tbEliminar.ImageIndex               := 25;
    tbPropiedades.ImageIndex            := 15;
    tbLimpiar.ImageIndex                := 3;
    tbOrdenar.ImageIndex                := 5;
    tbMostrarOcultarColumnas.ImageIndex := 14;
    tbImprimir.ImageIndex               := 7;
    tbExportar.ImageIndex               := 1;
    tbMostrarFiltros.ImageIndex         := 17;
    tbMaxRegistros.ImageIndex           := 19;
    tbSalir2.ImageIndex                 := 8;
  {$ENDIF}


  // Seteos para Análisis Médicos Periódicos
  {$IFDEF ADMIN_ANALISIS}
    ToolBar.Images    := frmPrincipal.imgGenBW;
    ToolBar.HotImages := frmPrincipal.imgGenColor;

    tbRefrescar.ImageIndex              := 6;
    tbNuevo.ImageIndex                  := 0;
    tbModificar.ImageIndex              := 1;
    tbEliminar.ImageIndex               := 2;
    tbPropiedades.ImageIndex            := 16;
    tbLimpiar.ImageIndex                := 5;
    tbOrdenar.ImageIndex                := 7;
    tbMostrarOcultarColumnas.ImageIndex := 15;
    tbImprimir.ImageIndex               := 9;
    tbExportar.ImageIndex               := 3;
    tbMostrarFiltros.ImageIndex         := 18;
    tbMaxRegistros.ImageIndex           := 20;
    tbSalir2.ImageIndex                 := 10;
  {$ENDIF}

  FSoloOtrosBancos := False;
end;

procedure TfrmManCCP_CUENTAPAGO.PrintResults;
var
  sSubTitulo: String;
begin
  QueryPrint.Footer.Text := Sesion.Usuario;

  sSubTitulo := GetSubTituloListado(FTipoAcreedor, FIdAcreedor, FCuitCuil);
  QueryPrint.SubTitle.Lines.Text := sSubTitulo;

  inherited;
end;

function TfrmManCCP_CUENTAPAGO.Execute(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String; bSoloOtrosBancos: Boolean = False): Boolean;
var
  bTipoAcreedorOk: Boolean;
  sAsignaConceptos: String;
  sFiltroAcreedor: String;
  sSql: String;
begin                           
  FSoloOtrosBancos := bSoloOtrosBancos;

  sAsignaConceptos := ValorSqlEX('select substr(tb_especial2,1,1) from art.ctb_tablas where tb_clave = :clave and tb_codigo = :cod', ['TACRE', sTipoAcreedor]);
  //if sTipoAcreedor = 'TA' then   // Trabajador Afiliado
  if sAsignaConceptos = 'S' then
  begin
    clbConceptosSinAsignar.AutoAjustarColumnas  := False;
    clbConceptosAsignados.AutoAjustarColumnas   := False;
  end
  else
    tbAsignarConceptosPagos.Enabled := False;

  sFiltroAcreedor := GetFiltroAcreedor(sTipoAcreedor, IdAcreedor, sCuitCuil, bTipoAcreedorOk);

  if bTipoAcreedorOk then
  begin
    sSql := 'SELECT DECODE(ba_codigo, ''999'', ''OTROS BANCOS'', ba_nombre) banco, ' +
                  ' tc.tb_descripcion descr_tipocuenta, sb_nombre descr_sucursal, cp_id, ' +
                  ' cp_nrocuenta, utiles.iif_char(cp_cbu1, null, null, cp_cbu1 || ''-'' || cp_cbu2) cbu, ' +
                  ' cp_fechabaja, trunc(cp_fechaaltamcarga) faprobado, ' +
                  ' tp.tb_descripcion descr_propiedad, ' +
                  ' cp_usualta, trunc(cp_fechaalta) fechaalta, cp_usubaja, trunc(cp_fechabaja) fechabaja ' +
              'FROM ccp_cuentapago, zba_banco, zsb_sucursalbanco, ' +
                  ' ctb_tablas tp, ctb_tablas tc ' +
            ' WHERE cp_idbanco = ba_id ' +
              ' AND tc.tb_clave(+) = ''BCOCT'' ' +
              ' AND tc.tb_codigo(+) = cp_tipocuenta ' +
              ' AND tp.tb_codigo(+) = cp_propiedad ' +
              ' AND tp.tb_clave(+) = ''PROCT'' ' +
              ' AND cp_idsucursal = sb_id(+) ' + sFiltroAcreedor + ' ' +
              ' AND cp_fechaalta IS NOT NULL';

    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
    RefreshData;

    FTipoAcreedor := sTipoAcreedor;
    FIdAcreedor    := IdAcreedor;
    FCuitCuil     := sCuitCuil;

    Result := ShowModal = mrOk;
  end
  else
    Result := False;
end;

procedure TfrmManCCP_CUENTAPAGO.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;
                                                        var AText: String; var AFont: TFont;
                                                        var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;

  if not sdqConsulta.FieldByName('fechabaja').IsNull then
    AFont.Style := [fsStrikeOut];
end;

procedure TfrmManCCP_CUENTAPAGO.tbNuevoClick(Sender: TObject);
begin
  if PermitirAltaCuentaBancaria(FTipoAcreedor, FIdAcreedor, FCuitCuil, True, ART_EMPTY_ID) then
    with TfrmAltaModifCCP_CUENTAPAGO.Create(Self) do
    try
      if Execute(ART_EMPTY_ID, FTipoAcreedor, FIdAcreedor, FCuitCuil, False, False, FSoloOtrosBancos) then
        RefreshData;
    finally
      Free;
    end;
end;

function TfrmManCCP_CUENTAPAGO.GetSubTituloListado(sTipoAcreedor: String; IdAcreedor: TTableId; sCuitCuil: String): String;
var
  sSql: String;
begin
  if sTipoAcreedor = 'CA' then                                   // Centro Asistencial
    sSql :=
      'SELECT ca_identificador || '' - '' || ca_clave || '' - '' || ca_descripcion' +
       ' FROM cpr_prestador' +
      ' WHERE ca_identificador = ' + SqlValue(IdAcreedor)
  else if sTipoAcreedor = 'EM' then                              // Empresa Afiliada
    {$IFDEF ART1_TO_2}
    sSql :=
      'SELECT em_cuit || '' - '' || em_nombre' +
       ' FROM aem_empresa' +
      ' WHERE em_id = ' + SqlValue(IdAcreedor)
    {$ELSE}
    sSql :=
      'SELECT mp_cuit || '' - '' || mp_nombre' +
       ' FROM cmp_empresas' +
      ' WHERE mp_cuit = ' + SqlValue(sCuitCuil)
      {$ENDIF}
  else if (sTipoAcreedor = 'OA') or (sTipoAcreedor = 'PA') then  // Otros Acreedores, Persona Autorizada
    sSql :=
      'SELECT pa_cuitcuil || '' - '' || pa_denomina' +
       ' FROM spa_pagoacre' +
      ' WHERE pa_cuitcuil = ' + SqlValue(sCuitCuil)
  else if sTipoAcreedor = 'PR' then                              // Productores
    sSql :=
      'SELECT ve_id || utiles.iif_char(ve_cuit, NULL, NULL, '' - '' || ve_cuit) || '' - '' || ve_nombre' +
       ' FROM xve_vendedor' +
      ' WHERE ve_id = ' + SqlValue(IdAcreedor)
  else if sTipoAcreedor = 'TA' then                              // Trabajador Afiliado
    {$IFDEF ART1_TO_2}
    sSql :=
      'SELECT tj_cuil || '' - '' || tj_nombre' +
       ' FROM ctj_trabajador' +
      ' WHERE tj_id = ' + SqlValue(IdAcreedor)
    {$ELSE}
    sSql :=
      'SELECT tj_cuil || '' - '' || tj_nombre' +
       ' FROM ctj_trabajador' +
      ' WHERE tj_cuil = ' + SqlValue(sCuitCuil)
      {$ENDIF}
  else if sTipoAcreedor = 'PV' then                              // Proveedores
    sSql :=
      'SELECT pv_cuit || '' - '' || pv_nombre' +
       ' FROM v_opv_proveedor' +
      ' WHERE pv_id = ' + SqlValue(IdAcreedor)
  else if sTipoAcreedor = 'EJ' then                              // Estudio Jurídico
    sSql :=
      'SELECT gc_cuit || '' - '' || gc_nombre' +
       ' FROM agc_gestorcuenta' +
      ' WHERE gc_id = ' + SqlValue(IdAcreedor)
  else if sTipoAcreedor = 'IM' then                              // Impuestos
    sSql :=
        'SELECT ie_cuit  || '' - '' || ie_nombre' +
         ' FROM cont.oie_impentidad' +
        ' WHERE ie_id = ' + SqlValue(IdAcreedor);

  Result := ValorSql(sSql);
end;

procedure TfrmManCCP_CUENTAPAGO.tbEliminarClick(Sender: TObject);
begin
  if sdqConsulta.FieldByName('cp_fechabaja').IsNull and MsgAsk('¿ Realmente desea dar de baja la cuenta bancaria seleccionada ?') then
  try
    with TSql.Create('ccp_cuentapago') do
    try
      SqlType := stUpdate;
      PrimaryKey.Add('cp_id', sdqConsulta.FieldByName('cp_id').AsInteger);

      Fields.Add('cp_fechabaja', exDateTime);
      Fields.Add('cp_usubaja',   Sesion.UserID);
      EjecutarSql(Sql);
      RefreshData;
    finally
      Free;
    end;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al dar de baja la cuenta bancaria.');
  end;
end;

procedure TfrmManCCP_CUENTAPAGO.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                  Highlight: Boolean);
begin
  inherited;
  if not sdqConsulta.FieldByName('cp_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManCCP_CUENTAPAGO.tbAsignarConceptosPagosClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay ningún registro seleccionado.');
  Verificar(not sdqConsulta.FieldByName('cp_fechabaja').IsNull, Grid, 'La cuenta bancaria se encuentra dada de baja.');

  DoCargarConceptosPago;
  fpAsignacionConceptosPago.ShowModal;
end;

procedure TfrmManCCP_CUENTAPAGO.spbSelTodosClick(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to clbConceptosSinAsignar.Items.Count - 1 do
    clbConceptosSinAsignar.Checked[iLoop] := IIF(Sender = spbSelTodos, True, False);
end;

procedure TfrmManCCP_CUENTAPAGO.spbAsignarClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  if clbConceptosSinAsignar.CheckCount = 0 then
    Exit;

  iLoop := 0;
  while iLoop <= clbConceptosSinAsignar.items.Count - 1 do
  begin
    if clbConceptosSinAsignar.Checked[iLoop] then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM ccp_cuentapago ccp1' +
        ' WHERE ccp1.cp_id = :cpid' +
          ' AND ccp1.cp_tipoacreedor = ''TA''' +
          ' AND EXISTS(SELECT 1' +
                       ' FROM ccp_cuentapago ccp2, scc_cuentaconcepto scc2' +
                      ' WHERE ccp2.cp_id = scc2.cc_idcuentapago' +
                        ' AND ccp1.cp_idacreedor = ccp2.cp_idacreedor' +
                        ' AND ccp2.cp_tipoacreedor = ''TA''' +
                        ' AND ccp2.cp_fechabaja IS NULL' +
                        ' AND scc2.cc_fechabaja IS NULL' +
                        ' AND scc2.cc_conceptopago = :conpago)';
      Verificar(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('cp_id').AsInteger, clbConceptosSinAsignar.Values[iLoop]]),
                                   clbConceptosSinAsignar, 'El concepto ' + clbConceptosSinAsignar.Values[iLoop] + ' ya ha sido asignado a otra cuenta.');
    end;

    Inc(iLoop);
  end;

  iLoop := 0;
  while iLoop <= clbConceptosSinAsignar.items.Count - 1 do
    if clbConceptosSinAsignar.Checked[iLoop] then
    begin
      clbConceptosAsignados.Add(clbConceptosSinAsignar.Items[iLoop], clbConceptosSinAsignar.Values[iLoop]);
      clbConceptosSinAsignar.Items.Delete(iLoop);
      clbConceptosSinAsignar.Values.Delete(iLoop);
    end
    else
      Inc(iLoop);

  btnAsignarCP.Enabled := True;
end;

procedure TfrmManCCP_CUENTAPAGO.spbDesasignarClick(Sender: TObject);
var
  iLoop: Integer;
begin
  if clbConceptosAsignados.CheckCount = 0 then
    Exit;

  iLoop := 0;
  while iLoop <= clbConceptosAsignados.Items.Count - 1 do
    if clbConceptosAsignados.Checked[iLoop] then
    begin
      clbConceptosSinAsignar.Add(clbConceptosAsignados.Items[iLoop], clbConceptosAsignados.Values[iLoop]);
      clbConceptosAsignados.Items.Delete(iLoop);
      clbConceptosAsignados.Values.Delete(iLoop);
    end
    else
      Inc(iLoop);

  btnAsignarCP.Enabled := True;
end;

procedure TfrmManCCP_CUENTAPAGO.clbConceptosSinAsignarDblClick(Sender: TObject);
var
  bCheck: Boolean;
  iLoop: Integer;
begin
  bCheck := (clbConceptosSinAsignar.CheckCount = 0);

  for iLoop := 0 to clbConceptosSinAsignar.Items.Count - 1 do
    clbConceptosSinAsignar.Checked[iLoop] := bCheck
end;

procedure TfrmManCCP_CUENTAPAGO.clbConceptosAsignadosDblClick(Sender: TObject);
var
  bCheck: Boolean;
  iLoop: Integer;
begin
  bCheck := (clbConceptosAsignados.CheckCount = 0);

  for iLoop := 0 to clbConceptosAsignados.Items.Count - 1 do
    clbConceptosAsignados.Checked[iLoop] := bCheck
end;

procedure TfrmManCCP_CUENTAPAGO.btnCancelarCPClick(Sender: TObject);
begin
  clbConceptosAsignados.ClearChecks;
  clbConceptosSinAsignar.ClearChecks;
end;

procedure TfrmManCCP_CUENTAPAGO.DoCargarConceptosPago;
var
  sSql: String;
begin
  clbConceptosSinAsignar.Clear;
  clbConceptosAsignados.Clear;

  sSql :=
    'SELECT   cp_conpago, cp_denpago' +
       ' FROM scp_conpago' +
      ' WHERE cp_tipo IN(''I'', ''P'', ''M'', ''O'', ''E'')' +
        ' AND cp_fbaja IS NULL' +
        ' AND (NOT EXISTS(SELECT 1' +
                          ' FROM scc_cuentaconcepto' +
                         ' WHERE cc_idcuentapago = :idcuentapago' +
                           ' AND cc_conceptopago = cp_conpago' +
                           ' AND cc_fechabaja IS NULL))' +
   ' ORDER BY cp_denpago';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('cp_id').AsInteger]) do
  try
    while not Eof do
    begin
      clbConceptosSinAsignar.Add(FieldByName('cp_denpago').AsString, FieldByName('cp_conpago').AsString);
      Next;
    end;
  finally
    Free;
  end;

  sSql :=
    'SELECT   cp_conpago, cp_denpago' +
       ' FROM scp_conpago, scc_cuentaconcepto' +
      ' WHERE cc_idcuentapago = :idcuentapago' +
        ' AND cc_conceptopago = cp_conpago' +
        ' AND cc_fechabaja IS NULL' +
        ' AND cp_fbaja IS NULL' +
   ' ORDER BY cp_denpago';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('cp_id').AsInteger]) do
  try
    while not Eof do
    begin
      clbConceptosAsignados.Add(FieldByName('cp_denpago').AsString, FieldByName('cp_conpago').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmManCCP_CUENTAPAGO.spbSelTodos2Click(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to clbConceptosAsignados.Items.Count - 1 do
    clbConceptosAsignados.Checked[iLoop] := IIF(Sender = spbSelTodos2, True, False);
end;

procedure TfrmManCCP_CUENTAPAGO.btnAsignarCPClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  BeginTrans;
  try
    for iLoop := 0 to clbConceptosSinAsignar.Items.Count - 1 do
    begin
      sSql :=
        'SELECT 1' +
         ' FROM scc_cuentaconcepto' +
        ' WHERE cc_idcuentapago = :idcuentapago' +
          ' AND cc_conceptopago = :conceptopago' +
          ' AND cc_fechabaja IS NULL';

      if ExisteSqlEx(sSql, [sdqConsulta.FieldByName('cp_id').AsInteger, clbConceptosSinAsignar.Values[iLoop]]) then
      begin
        sSql :=
          'UPDATE scc_cuentaconcepto' +
            ' SET cc_fechabaja = SYSDATE,' +
                ' cc_usubaja = :usubaja' +
          ' WHERE cc_fechabaja IS NULL' +
            ' AND cc_idcuentapago = :idcuentapago' +
            ' AND cc_conceptopago = :conceptopago';
        EjecutarSqlSTEx(sSql, [Sesion.UserID, sdqConsulta.FieldByName('cp_id').AsInteger, clbConceptosSinAsignar.Values[iLoop]]);
      end;
    end;

    for iLoop := 0 to clbConceptosAsignados.Items.Count - 1 do
    begin
      sSql :=
        'SELECT 1' +
         ' FROM scc_cuentaconcepto' +
        ' WHERE cc_idcuentapago = :idcuentapago' +
          ' AND cc_conceptopago = :conceptopago' +
          ' AND cc_fechabaja IS NOT NULL';
      if ExisteSqlEx(sSql, [sdqConsulta.FieldByName('cp_id').AsInteger, clbConceptosAsignados.Values[iLoop]]) then
      begin
        sSql :=
          'UPDATE scc_cuentaconcepto' +
            ' SET cc_fechabaja = NULL,' +
                ' cc_usubaja = NULL' +
          ' WHERE cc_fechabaja IS NOT NULL' +
            ' AND cc_idcuentapago = :idcuentapago' +
            ' AND cc_conceptopago = :conceptopago';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('cp_id').AsInteger, clbConceptosAsignados.Values[iLoop]]);
      end
      else
      begin
        sSql :=
          'SELECT 1' +
           ' FROM scc_cuentaconcepto' +
          ' WHERE cc_idcuentapago = :idcuentapago' +
            ' AND cc_conceptopago = :conceptopago' +
            ' AND cc_fechabaja IS NULL';
        if not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('cp_id').AsInteger, clbConceptosAsignados.Values[iLoop]]) then
        begin
          sSql :=
            'INSERT INTO scc_cuentaconcepto' +
                       ' (cc_id, cc_conceptopago, cc_idcuentapago, cc_usualta, cc_fechaalta)' +
                ' VALUES (:id, :conceptopago, :idcuentapago, :usualta, SYSDATE)';
          EjecutarSqlSTEx(sSql, [GetSecNextVal('SEQ_SCC_ID'), clbConceptosAsignados.Values[iLoop],
                                 sdqConsulta.FieldByName('cp_id').AsInteger, Sesion.UserID]);
        end;
      end;
    end;

    CommitTrans;
    MessageDlg('Conceptos de pago registrados.', mtInformation, [mbOk], 0);
    btnAsignarCP.Enabled := false;
  except
    on E: Exception do
    begin
      Rollback;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar los conceptos de pago.');
    end;
  end
end;

procedure TfrmManCCP_CUENTAPAGO.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay ningún registro seleccionado.');
  Verificar(not sdqConsulta.FieldByName('cp_fechabaja').IsNull, Grid, 'La cuenta bancaria se encuentra dada de baja.');
  Verificar(not sdqConsulta.FieldByName('faprobado').IsNull, Grid, 'La cuenta bancaria ya se encuentra validada.');

  with TfrmAltaModifCCP_CUENTAPAGO.Create(Self) do
  try
    if Execute(sdqConsulta.FieldByName('cp_id').AsInteger, FTipoAcreedor, FIdAcreedor, FCuitCuil, False, True, FSoloOtrosBancos) then
      RefreshData;
  finally
    Free;
  end;
end;

end.
