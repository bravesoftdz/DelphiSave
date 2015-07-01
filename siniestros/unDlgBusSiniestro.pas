unit unDlgBusSiniestro;

interface

uses
  {$IFNDEF VER150}
  rxPlacemnt,
  rxToolEdit,
  {$ELSE}
  Placemnt,
  ToolEdit,
  {$ENDIF}
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, DateComboBox, unArtFrame,
  unArtDbFrame, unFraEmpresa, StdCtrls, Mask, FieldHider, ShortCutControl, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtDBAwareFrame, unFraTrabajadorSiniestro, unArt, PatternEdit, IntEdit, FormPanel, DateTimeEditors, unFraTrabajador,
  JvgGroupBox, DBCtrls, JvExControls, JvComponent, JvXPCore, JvXPButtons, JvExMask, JvToolEdit, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvDBControls, JvExExtCtrls,
  JvRadioGroup, ImgList;

type
  TfrmDlgBusSiniestro = class(TfrmCustomConsulta)
    Panel1: TPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Panel2: TPanel;
    CUIL: TLabel;
    Label1: TLabel;
    fraEX_CUIL: TfraTrabajadorSiniestro;
    fpAlta: TFormPanel;
    edSiniestro: TIntEdit;
    Label2: TLabel;
    lblFecha: TLabel;
    btnCancelarAlta: TButton;
    btnAceptarAlta: TButton;
    Bevel1: TBevel;
    pnlBottom: TPanel;
    edFecha: TDateComboBox;
    gbDatos: TJvgGroupBox;
    edCUIT: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    edEmpresa: TDBEdit;
    Label6: TLabel;
    edBreveDescripcion: TDBMemo;
    Label7: TLabel;
    edDiagnostico: TDBMemo;
    pnlSpacer: TPanel;
    fraEmpresaAlta: TfraEmpresa;
    Label8: TLabel;
    fraTrabajadorAlta: TfraTrabajadorSiniestro;
    Label9: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    tbToolbarAlta: TToolBar;
    tbManTrab: TToolButton;
    Label3: TLabel;
    edFechaAccidente: TDateEdit;
    edFechaAcc: TDateEdit;
    Label10: TLabel;
    fraEX_CUIT: TfraEmpresa;
    ShortCutControlHijo: TShortCutControl;
    chkSiniestroCompleto: TCheckBox;
    lbVisualizandoSiniestro: TLabel;
    chkSiniestroRecaidas: TCheckBox;
    pnlBotones: TPanel;
    btnNuevoSiniestro: TJvXPButton;
    btnNuevaRecaida: TJvXPButton;
    btnNuevoSiniestroMultiple: TJvXPButton;
    Label11: TLabel;
    edDenunciaSRT: TJvDBMaskEdit;
    Label12: TLabel;
    edDG_NRODENUNCIASRT: TJvMaskEdit;
    chkReapDictContTto: TCheckBox;
    rgAccTransito: TRadioGroup;
    ilTrabajador: TImageList;
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure AltaSiniestro(Sender: TObject);
    procedure AltaOrden(Sender: TObject);
    procedure AltaRecaida(Sender: TObject);
    procedure btnAceptarAltaClick(Sender: TObject);
    procedure fpAltaShow(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure tbManTrabClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraEX_CUILtbLimpiarClick(Sender: TObject);
    procedure OnFiltroChange(Sender: TObject);
    procedure fraEX_CUILcmbNombreDropDown(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure FSFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFechaAccidenteChange(Sender: TObject);
    procedure edDG_NRODENUNCIASRTChange(Sender: TObject);
    procedure edDG_NRODENUNCIASRTExit(Sender: TObject);
    procedure rgAccTransitoEnter(Sender: TObject);
  private
    FSoloConsulta: Boolean;

    function AltaGeneral(nTipoAlta: integer): boolean;
    function Get_FechaRecepcion_EV(aSiniestro, aOrden: Integer; dFechaRecaida: TDateTime): TDate;   // TK 22620
    function GetFechaAccidente: TDateTime;
    function Posee_SinRechxNoRelLabEmpresa: Boolean;
    // function ValidaDictamenPagoDirecto: Boolean;
    function Validar_ReaperturaConDictamen(iSiniestro, iOrden: Integer): Boolean;   // TK 22620

    procedure Do_GenerarSolicitudAsistencia(aFechaRecep: TDateTime; aIdexpediente: Integer; aTipoAcc: String);       // TK 22620
    procedure OnAltaChange(Sender: TObject);
    procedure SetFechaAccidente(const Value: TDateTime);
    procedure SetSoloConsulta(const Value :Boolean);

    function RecaOSiniAnteriorConAltaPorAbandono: Boolean;  // TK 57265

  protected
    procedure ClearData; override;
    procedure EnableButtons(aEnabled: Boolean = True); override;
    procedure RefreshData; override;
  public
    property FechaAccidente: TDateTime read GetFechaAccidente write SetFechaAccidente;
    property SoloConsulta: Boolean     read FSoloConsulta     write SetSoloConsulta   default False;
  end;

function GetIdSiniestro(aIdEmpresa: TTableId = ART_EMPTY_ID;
                        aIdTrabajador: TTableId = ART_EMPTY_ID;
                        aIdSiniestro: TTableId = ART_EMPTY_ID;
                        aFechaAccidente: TDateTime = 0;
                        aSoloConsulta: Boolean = False;
                        aVisualizarBotones : Boolean = True): Integer;

const
  cTIPOEGRESO_ABANDONO = '3';

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, VCLExtra, CustomDlgs, General, CUIT, unSiniestros, unSesion,
  DateTimeFuncs, Math, unContratoTrabajador, unRedPres, SinEdit, unTercerizadoras, unComunes, unMoldeEnvioMail, unGrids;

{$R *.DFM}

function GetIdSiniestro(aIdEmpresa: TTableId = ART_EMPTY_ID;
                        aIdTrabajador: TTableId = ART_EMPTY_ID;
                        aIdSiniestro: TTableId = ART_EMPTY_ID;
                        aFechaAccidente: TDateTime = 0;
                        aSoloConsulta: Boolean = False;
                        aVisualizarBotones: Boolean = True): Integer;
begin
  with TfrmDlgBusSiniestro.Create(Application) do
  try
    fraEX_CUIL.Value := aIdTrabajador;

    if (aIdTrabajador = ART_EMPTY_ID) or (fraEX_CUIL.Contrato = ART_EMPTY_ID) then       // TK 48364
      fraEX_CUIT.Value := aIdEmpresa
    else
      fraEX_CUIT.Contrato := fraEX_CUIL.Contrato;

      
    FechaAccidente   := aFechaAccidente;
    SoloConsulta     := aSoloConsulta;

    if aIdSiniestro <> ART_EMPTY_ID then
      fraEX_CUIL.IDSiniestro := aIdSiniestro;

    if not aVisualizarBotones then
    begin
      btnNuevoSiniestro.Visible := False;
      btnNuevoSiniestroMultiple.Visible := False;
      btnNuevaRecaida.Visible := False;
    end;

    if ShowModal = mrOk then
      Result := sdqConsulta.FieldByName('ex_id').AsInteger
    else
      Result := aIdSiniestro;

  finally
    Free;
  end;
end;

{------------------------------------------------------------------------------}
{ TfrmDlgBusInforme }
{------------------------------------------------------------------------------}
procedure TfrmDlgBusSiniestro.ClearData;
begin
  fraEX_CUIT.Clear;
  fraEX_CUIL.Clear;
  edFechaAccidente.Clear;
  edDG_NRODENUNCIASRT.Clear;
  tbRefrescar.Enabled := False;
  lbVisualizandoSiniestro.Caption := '';
  chkSiniestroRecaidas.Enabled := False;
  chkSiniestroRecaidas.Checked := False;
  chkSiniestroCompleto.Enabled := False;
  chkSiniestroCompleto.Checked := False;

  if fraEX_CUIL.mskCUIL.CanFocus then
    fraEX_CUIL.mskCUIL.SetFocus;

  inherited;
end;

procedure TfrmDlgBusSiniestro.EnableButtons(aEnabled: Boolean);
begin
  inherited;
  VCLExtra.LockControls(btnAceptar, not aEnabled);
end;

procedure TfrmDlgBusSiniestro.RefreshData;
var
  iCantidad: Integer;
  sSql: String;
  sSql2: String;
begin
  lbVisualizandoSiniestro.Caption := '';
  if fraEX_CUIT.IsSelected or fraEX_CUIL.IsSelected or Is_DenunciaSRT_Valida(edDG_NRODENUNCIASRT.EditText) then
  begin
    sSql :=
      'SELECT ex_id, ex_siniestro, ex_orden, ex_recaida, ex_tipo, dg_nrodenunciasrt,' +
            ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_fechaaccidente,' +
            ' ta_descripcion, pi_fechabajamedica, pe_fechaaltamedica, ex_brevedescripcion, ex_fecharecaida,' +
            ' ex_causafin, em_cuit, em_nombre, tj_cuil, tj_nombre, ex_diagnostico, em_id, ex_fechamanifestacion,' +
            ' ex_fechaexpuesto' +
       ' FROM sex_expedientes, SIN.spe_partedeegreso, SIN.sta_tipoaccidente, SIN.sdg_denunciagrave a, aem_empresa,' +
            ' ctj_trabajador, SIN.spi_partedeingreso' +
      ' WHERE ex_id = pe_idexpediente(+)' +
        ' AND ex_id = pi_idexpediente(+)' +
        ' AND ex_id = a.dg_idexpediente' + IIF(Is_DenunciaSRT_Valida(edDG_NRODENUNCIASRT.EditText), ' ', '(+) ') +
        ' AND (   a.dg_nroparte = (SELECT MAX(b.dg_nroparte)' +
                                   ' FROM SIN.sdg_denunciagrave b' +
                                  ' WHERE a.dg_idexpediente = b.dg_idexpediente' +
                                    ' AND b.dg_fechabaja IS NULL)' +
             ' OR (    a.dg_nroparte IS NOT NULL' +
                 ' AND a.dg_fechabaja IS NOT NULL)' +
             ' OR a.dg_nroparte IS NULL)' +
        ' AND ex_tipo = ta_codigo(+)' +
        ' AND ex_cuit = em_cuit' +
        ' AND ex_cuil = tj_cuil';

    if (fraEX_CUIT.IsSelected) and (not chkSiniestroCompleto.Checked) then
    begin
      AddCondition(sSql, 'em_id = ' + SqlValue(fraEX_CUIT.Value));
      if not fraEX_CUIL.IsSelected then
        LogAuditoria('CS', fraEX_CUIT.CUIT);
    end;

    if (fraEX_CUIL.IsSelected) and (not chkSiniestroCompleto.Checked) then
      AddCondition(sSql, 'tj_documento = ' + SqlValue(GetDNI(fraEX_CUIL.CUIL)));

    if fraEX_CUIL.Tercerizadoras then
      AddCondition(sSql, 'art.siniestro.is_sinitercerizado(ex_siniestro, ex_orden, ex_recaida) = ''S'' ');

    if Is_DenunciaSRT_Valida(edDG_NRODENUNCIASRT.EditText) then
      AddCondition(sSql, 'dg_nrodenunciasrt = ' + SQLValue(Get_DenunciaSRT(edDG_NRODENUNCIASRT.EditText)));

    if fraEX_CUIL.TieneSiniestro then
    begin
      AddCondition(sSql, 'ex_siniestro = ' + SqlValue(fraEX_CUIL.edSiniestro.Siniestro));

      if not chkSiniestroCompleto.Checked then
        AddCondition(sSql, 'ex_orden = ' + SqlValue(fraEX_CUIL.edSiniestro.Orden))
      else
        lbVisualizandoSiniestro.Caption := 'Visualizando el siniestro ' + fraEX_CUIL.edSiniestro.SiniestroS + ' (Todas sus órdenes)';

      if not chkSiniestroRecaidas.Checked then
      begin
        if chkSiniestroCompleto.Checked then
          AddCondition(sSql, 'ex_recaida = 0 ')
        else
          AddCondition(sSql, 'ex_recaida = ' + SqlValue(fraEX_CUIL.edSiniestro.Recaida));
      end
      else
        lbVisualizandoSiniestro.Caption := 'Visualizando el siniestro ' + fraEX_CUIL.edSiniestro.SiniestroS + ' (Todas sus recaídas)';

      if chkSiniestroCompleto.Checked and chkSiniestroRecaidas.Checked then
        lbVisualizandoSiniestro.Caption := 'Visualizando el siniestro ' + fraEX_CUIL.edSiniestro.SiniestroS + ' (Todas sus órdenes y recaídas)';
    end;

    if (edFechaAccidente.Date <> 0) and (not chkSiniestroCompleto.Checked) and (not chkSiniestroRecaidas.Checked) and (not fraEX_CUIL.TieneSiniestro) then
      AddCondition(sSql, 'ex_fechaaccidente >= ' + SqlDate(edFechaAccidente.Date));

    if sdqConsulta.SQL.Text <> (sSql + SortDialog.OrderBy) then
    begin
      if fraEX_CUIL.IsEmpty and (edFechaAccidente.Date = 0) and (not chkSiniestroCompleto.Checked) and (not chkSiniestroRecaidas.Checked) then
      begin
        sSql2 :=
          'SELECT COUNT(*)' +
           ' FROM sex_expedientes' +
          ' WHERE ex_cuit = :cuit' +
                  IIF(fraEX_CUIL.Tercerizadoras, ' AND art.siniestro.is_sinitercerizado(ex_siniestro, ex_orden, ex_recaida) = ''S''', '');
        iCantidad := ValorSQLIntegerEx(sSql2, [fraEX_CUIT.CUIT]);

        if (iCantidad > 1000) then
          if not MsgAsk('La empresa ' + fraEX_CUIT.NombreEmpresa + ' posee alrededor de ' + IntToStr(iCantidad) +
                        ' siniestros y la consulta puede demorar.' + CRLF + '¿ Desea verlos de todas formas ?') then
            Exit;
      end;

      sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
      inherited;
    end;

    if Grid.CanFocus and Visible then
      Grid.SetFocus;
  end;
end;

procedure TfrmDlgBusSiniestro.GridDblClick(Sender: TObject);
begin
  if btnAceptar.Enabled then
    ModalResult := mrOk;
end;

procedure TfrmDlgBusSiniestro.OnEmpresaChange(Sender: TObject);
var
  sCuil: String;
begin
  if (fraEX_CUIL.Contrato <> fraEX_CUIT.Contrato) then
  begin
    sCuil := fraEX_CUIL.CUIL;
    fraEX_CUIL.Contrato := fraEX_CUIT.Contrato;
    fraEX_CUIL.CUIL := sCuil;
  end;

  OnFiltroChange(nil);
end;

procedure TfrmDlgBusSiniestro.OnTrabajadorChange(Sender: TObject);
begin
  OnFiltroChange(nil);
end;

procedure TfrmDlgBusSiniestro.OnFiltroChange(Sender: TObject);
begin
  if fraEX_CUIL.TieneSiniestro and (fraEX_CUIL.sdqDatos.FieldByName('em_id').AsInteger <> fraEX_CUIT.Value) then
  begin
   // fraEX_CUIT.Value := fraEX_CUIL.sdqDatos.FieldByName('em_id').AsInteger;
    fraEX_CUIT.Contrato   := fraEX_CUIL.Contrato;   // TK 48364

    edFechaAccidente.Date := fraEX_CUIL.sdqDatos.FieldByName('ex_fechaaccidente').AsDateTime;
  end;

  chkSiniestroCompleto.Enabled := fraEX_CUIL.TieneSiniestro;

  if not chkSiniestroCompleto.Checked then
    chkSiniestroRecaidas.Enabled := fraEX_CUIL.TieneSiniestro;

  sdqConsulta.Close;
  tbRefrescar.Enabled := fraEX_CUIL.IsSelected or fraEX_CUIT.IsSelected;
  if tbRefrescar.Enabled then
    tbRefrescar.Click;

  btnNuevoSiniestro.Enabled := Seguridad.Activar(btnNuevoSiniestro) and ((fraEX_CUIL.IsSelected and fraEX_CUIT.IsSelected)
                               or (sdqConsulta.Active and not sdqConsulta.IsEmpty));
  tbNuevo.Enabled := btnNuevoSiniestro.Enabled;
end;

procedure TfrmDlgBusSiniestro.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF VER180}
  AutoColWidths := True;
  {$ENDIF}
  with fraEX_CUIT do
  begin
    ShowBajas := True;
    OnChange := OnFiltroChange;
    UltContrato := True;
    Confidencialidad := True;
    Tercerizadoras := EsUsuarioDeTercerizadora();
  end;

  with fraEmpresaAlta do
  begin
    OnChange := OnAltaChange;
    ShowBajas := True;
    UltContrato := True;
    Confidencialidad := True;
    Tercerizadoras := EsUsuarioDeTercerizadora();
  end;

  with fraEX_CUIL do
  begin
    MostrarRelaLaboral := False;
    ShowBajas := True;
    OnChange := OnFiltroChange;
    Tercerizadoras := EsUsuarioDeTercerizadora();
  end;

  with fraTrabajadorAlta do
  begin
    MostrarRelaLaboral := False;
    ShowBajas := True;
    Tercerizadoras := EsUsuarioDeTercerizadora();
  end;

  lbVisualizandoSiniestro.Caption := '';
  VCLExtra.LockControls(gbDatos, True);
  chkReapDictContTto.Visible := False;  // TK 22620

//  LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
end;

procedure TfrmDlgBusSiniestro.tbPropiedadesClick(Sender: TObject);
begin
  inherited;

  if (sdqConsulta.Active) and (not sdqConsulta.IsEmpty) then
  begin
    DynColWidthsByData(Grid);
    Grid.ColumnByField['ex_causafin'].Width := 36;
    Grid.ColumnByField['ex_fechaaccidente'].Width := 60;
    Grid.ColumnByField['ex_fecharecaida'].Width := 60;
    Grid.ColumnByField['pi_fechabajamedica'].Width := 60;
    Grid.ColumnByField['pe_fechaaltamedica'].Width := 60;
    Width := Min(GetColumnWidths(Grid, True), Screen.Width);
  end;
end;

procedure TfrmDlgBusSiniestro.FSFormShow(Sender: TObject);
begin
  inherited;
  OnFiltroChange(nil);
end;

procedure TfrmDlgBusSiniestro.tbRefrescarClick(Sender: TObject);
begin
  Verificar((fraEX_CUIT.Value = ART_EMPTY_ID) and (fraEX_CUIL.Value = ART_EMPTY_ID) and fraEX_CUIL.CanFocus and (not Is_DenunciaSRT_Valida(edDG_NRODENUNCIASRT.EditText)), fraEX_CUIT.edContrato, 'Debe seleccionar al menos la empresa, el trabajador o el n° de denuncia SRT.');
  inherited;
end;

procedure TfrmDlgBusSiniestro.AltaSiniestro(Sender: TObject);
begin
  if AltaGeneral(0) then
    VCLExtra.LockControls(edSiniestro, True);
end;

procedure TfrmDlgBusSiniestro.AltaOrden(Sender: TObject);
begin
  AltaGeneral(1);
end;

procedure TfrmDlgBusSiniestro.AltaRecaida(Sender: TObject);
begin
  AltaGeneral(2);
end;

procedure TfrmDlgBusSiniestro.btnAceptarAltaClick(Sender: TObject);
var
  bValor1: Boolean;
  bValor2: Boolean;
  dFechaAcc: TDateTime;
  eIncapacidad: Extended;
  iCobertura: Integer;
  sCuit: String;
  sSql: String;
begin
  //verificar(UsuarioAptoCarga(fraEX_CUIT.ID, dbdatetime), btnNuevoSiniestro, '');
  Verificar(edSiniestro.Enabled and edSiniestro.IsEmpty, edFecha, 'Debe completar el número de siniestro.');
  Verificar((rgAccTransito.ItemIndex = 0) and (fpAlta.Tag <> 2), rgAccTransito, 'Debe indicar si corresponde a un accidente de tránsito.');
  Verificar(edFecha.Date = 0, edFecha, 'Debe completar la fecha.');
  Verificar(fraTrabajadorAlta.IsEmpty, fraTrabajadorAlta.mskCUIL, 'Debe completar el trabajador.');
  Verificar(fraEmpresaAlta.IsEmpty, fraEmpresaAlta.edContrato, 'Debe completar la empresa.');

  sSql :=
    'SELECT 1' +
     ' FROM sex_expedientes' +
    ' WHERE ex_siniestro = :siniestro';
  Verificar(((fpAlta.Tag = 1) or (fpAlta.Tag = 2)) and not ExisteSqlEx(sSql, [edSiniestro.Value]),
            edSiniestro, Format('El siniestro %d no existe en la base de datos.', [edSiniestro.Value]));

  Verificar(edFecha.Date > DBDate, edFecha, 'La fecha no puede ser mayor que la del día en curso.');
  Verificar(edFecha.Date < SIN_ART_MINFECHA, edFecha, Format('La fecha no puede ser menor que el %s.', [DateToStr(SIN_ART_MINFECHA)]));
  Verificar(not Is_RelacionLaboralActual_o_Historica(fraEmpresaAlta.CUIT, fraTrabajadorAlta.CUIL), fraTrabajadorAlta.mskCUIL,
            'El trabajador no pertenece ni perteneció nunca a la empresa ' + fraEmpresaAlta.NombreEmpresa + ' en nuestra base de datos.');
  Verificar(not Is_TrabajadorCorrecto(fraTrabajadorAlta.CUIL), fraTrabajadorAlta.mskCUIL, 'Existe otro trabajador con la C.U.I.L. cargada correctamente, a diferencia del que Ud. ha seleccionado.');

  case fpAlta.Tag of
    0: // Siniestro
      begin
        sSql :=
          'SELECT 1' +
           ' FROM DUAL' +
          ' WHERE emi.utiles.is_periodosinpersonal(:contrato, LEAST(art.cobranza.get_ultperiododevengado(''D''), TO_CHAR(:fecha, ''YYYYMM''))) = ''S''' +
            ' AND emi.aceptacion.is_trabajadoresmiregistro(:contrato, TO_CHAR(:fecha, ''YYYYMM'')) = ''N''';

        Verificar(not(Is_SiniestroGobernacion(edSiniestro.Value)) and     // No cambie la funcion porque se la llama con el edSiniestro del alta y no poseo ni la orden ni la recaida.
                  not(Seguridad.Claves.IsActive('AltaEmpresaSinPersonal')) and ExisteSqlEx(sSql, [fraEmpresaAlta.Contrato, TDateTimeEx.Create(edFecha.Date)]),
                  fraEmpresaAlta, 'La empresa no posee personal en el último período devengado.');
        Verificar(Posee_SinRechxNoRelLabEmpresa, fraEmpresaAlta, 'El trabajador posee un siniestro abierto y rechazado por no poseer relación laboral con la Empresa');  // TK 9290
      end;
    1: // Orden
      begin
        sSql :=
          'SELECT 1' +
           ' FROM sex_expedientes' +
          ' WHERE ex_siniestro = :siniestro';
        Verificar(not ExisteSqlEx(sSql, [edSiniestro.Value]), edSiniestro, 'El siniestro no existe.');

        sSql :=
          'SELECT ex_fechaaccidente' +
           ' FROM sex_expedientes' +
          ' WHERE ex_siniestro = :siniestro' +
            ' AND ex_orden = 1' +
            ' AND ex_recaida = 0';
        dFechaAcc := ValorSqlDateTimeEx(sSql, [edSiniestro.Value]);
        Verificar(edFecha.Date < dFechaAcc, edFecha, Format('La fecha del accidente múltiple no puede ser menor que la fecha del accidente (%s).', [DateToStr(dFechaAcc)]));

        sSql :=
          'SELECT ex_cuit' +
           ' FROM sex_expedientes' +
          ' WHERE ex_siniestro = :siniestro' +
            ' AND ex_orden = 1' +
            ' AND ex_recaida = 0';
        sCuit := ValorSqlEx(sSql, [edSiniestro.Value]);

        bValor1 := ValorSQLEx('SELECT art.siniestro.is_nroexpediente(:cuit, :fecha) FROM DUAL', [sCuit, TDateTimeEx.Create(edFecha.Date)]) = 'S';
        bValor2 := ValorSQLEx('SELECT art.siniestro.is_nroexpediente(:cuit, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, TDateTimeEx.Create(edFecha.Date)]) = 'S';

        if bValor1 <> bValor2 then
        begin
          MsgBox('No se puede abrir un siniestro múltiple entre estas dos empresas.');
          fraEmpresaAlta.cmbRSocial.SetFocus;
          Abort;
        end;
      end;
    2: // Recaída
      begin
        sSql :=
          'SELECT ex_fechaaccidente' +
           ' FROM sex_expedientes' +
          ' WHERE ex_siniestro = :siniestro' +
            ' AND ex_orden = :orden' +
            ' AND ex_recaida = 0';
        dFechaAcc := ValorSqlDateTimeEx(sSql, [edSiniestro.Value, sdqConsulta.FieldByName('ex_orden').AsInteger]);
        Verificar(edFecha.Date < dFechaAcc, edFecha, Format('La fecha de recaída no puede ser menor o igual que la fecha del accidente (%s).', [FormatDateTime('dd/mm/yyyy', dFechaAcc)]));

        if Is_PEgresoControlPostAlta(edSiniestro.Value, sdqConsulta.FieldByName('ex_orden').AsInteger) then
          if not MsgAsk('El siniestro posee un alta anterior con Control Post-Alta.' + CRLF + '¿ Desea continuar ?') then
          begin
            edFecha.SetFocus;
            Abort;
          end;

        if Is_RecaidasSinAlta(edSiniestro.Value, sdqConsulta.FieldByName('ex_orden').AsInteger) then
          if not MsgAsk('Existen recaídas anteriores sin fecha de alta médica.' + CRLF + '¿ Desea continuar ?') then
          begin
            edFecha.SetFocus;
            Abort;
          end;

        if Is_SiniestroPatologiaCronica(edSiniestro.Value, sdqConsulta.FieldByName('ex_orden').AsInteger) then
          if not MsgAsk('Existen recaídas anteriores asignadas al grupo de Patologías Crónicas.' + CRLF + '¿ Desea continuar ?') then
          begin
            edFecha.SetFocus;
            Abort;
          end;

        {if not(ValidaDictamenPagoDirecto) and (Seguridad.Claves.IsActive('AltaRecaidaConDictamen')) and         // TK 48483
           (msgask('Atencion: se dispone a abrir una recaída de un siniestro que posee un Dictamen de Continua Tratamiento en la fecha ingresada y Pagos Directos de ILT aprobados. ¿Desea continuar?') = false) then
        begin
          edFecha.SetFocus;
          Abort;
        end;}

        if RecaOSiniAnteriorConAltaPorAbandono and         // TK 57265
          (msgask('Atencion: se dispone a abrir una recaída que posee un Siniestro original o Reingreso con Alta por Abandono de tratamiento. ¿Desea continuar?') = false) then
        begin
          edFecha.SetFocus;
          Abort;
        end;

        {if not(Seguridad.Claves.IsActive('AltaRecaidaConDictamen')) and not(ValidaDictamenPagoDirecto) then
        begin
          MsgBox('No se puede abrir una recaída de un siniestro que posee un  ' + #13 +
                 'Dictamen de Continua Tratamiento en la fecha ingresada y Pagos Directos de ILT aprobados.');
          edFecha.SetFocus;
          Abort;
        end;}

        if chkReapDictContTto.Checked and not Validar_ReaperturaConDictamen(edSiniestro.Value, sdqConsulta.FieldByName('ex_orden').AsInteger) then  // TK 22620
          Abort;

        bValor1 := ValorSQLEx('SELECT art.siniestro.is_nroexpediente(:cuit, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, TDateTimeEx.Create(edFecha.Date)]) = 'S';
        bValor2 := ValorSQLEx('SELECT art.siniestro.is_nroexpediente(:cuit, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, TDateTimeEx.Create(dFechaAcc)]) = 'S';

        if bValor1 <> bValor2 then
          if not MsgAsk('¿ Verificó que se trata de una recaída ?') then
          begin
            edFecha.SetFocus;
            Abort;
          end;

      end;

  end;

  if (Tag = 0) or (Tag = 1) then // Siniestro o siniestro múltiple
    Verificar(Is_ExisteSiniestro(fraEmpresaAlta.CUIT, fraTrabajadorAlta.CUIL, edFecha.Date), edSiniestro, 'Para el CUIT, nro. de documento del trabajador y fecha de accidente indicados, ya existe un expediente.');

  // Verificación del estado de la EMPRESA
  if ValorSQLEx('SELECT art.afiliacion.check_cobertura(:cuit, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, TDateTimeEx.Create(edFecha.Date)]) <> 1 then
    if not MsgAsk(ValorSQLEx('SELECT art.afiliacion.msg_cobertura(:cuit, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, TDateTimeEx.Create(edFecha.Date)]) + CRLF + '¿ Desea continuar ?') then
      Abort;

  // Verificación del estado del TRABAJADOR
  iCobertura := ValorSQLIntegerEx('SELECT art.afiliacion.check_cobertura(:cuit, :cuil, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, fraTrabajadorAlta.CUIL, TDateTimeEx.Create(edFecha.Date)]);

  if iCobertura <> TRABAJADOR_OK then
  begin
    if iCobertura = TRABAJADOR_MUERTO then
      InfoHint(fraTrabajadorAlta.mskCUIL, ValorSQLEx('SELECT art.afiliacion.msg_cobertura(:cuit, :cuil, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, fraTrabajadorAlta.CUIL, TDateTimeEx.Create(edFecha.Date)]), True)
    else
      if not MsgAsk(ValorSQLEx('SELECT art.afiliacion.msg_cobertura(:cuit, :cuil, :fecha) FROM DUAL', [fraEmpresaAlta.CUIT, fraTrabajadorAlta.CUIL, TDateTimeEx.Create(edFecha.Date)]) + CRLF + '¿ Desea continuar ?') then
        Abort;
  end;

  // El Empleador y el Trabajador no pueden ser la misma persona
  Verificar(GetDNI(fraEmpresaAlta.CUIT) = GetDNI(fraTrabajadorAlta.CUIL), fraEmpresaAlta.edContrato, 'El empleador y el trabajador no pueden ser la misma persona.');

  sSql :=
    'SELECT NVL(MAX(REPLACE(art.srt_ssn.get_porcinca(ex_siniestro, ex_orden, ex_recaida), ''.'', '','')), 0)' +
     ' FROM sex_expedientes' +
    ' WHERE ex_cuil = :cuil';
  eIncapacidad := ValorSQLExtendedEx(sSql, [fraTrabajadorAlta.CUIL], 0);
  if eIncapacidad > 65 then
    if not MsgAsk(Format('El trabajador informado posee una incapacidad anterior del %s.' +
                  CRLF + '¿ Desea continuar ?', [FloatToStr(eIncapacidad) + '%'])) then
      Abort;

  fpAlta.ModalResult := mrOK;
end;

function TfrmDlgBusSiniestro.GetFechaAccidente: TDateTime;
begin
  Result := edFechaAccidente.Date;
end;

procedure TfrmDlgBusSiniestro.SetFechaAccidente(const Value: TDateTime);
begin
  edFechaAccidente.Date := Value;
end;

procedure TfrmDlgBusSiniestro.fpAltaShow(Sender: TObject);
begin
  inherited;
  edFecha.MaxDate := DBDate;
  rgAccTransito.ItemIndex := 0;
  case fpAlta.Tag of
    0: // Siniestro
      rgAccTransitoEnter(Sender);
    1: // Orden
      rgAccTransitoEnter(Sender);
    2: //Recaída
      chkReapDictContTto.SetFocus;
  end;
end;

function TfrmDlgBusSiniestro.AltaGeneral(nTipoAlta: integer): boolean;
var
  flgGraba, bPosibleRec: boolean;
  dFechaAcc, dFechaRec, dFechaAux, dFechaRecepcion_EV: TDateTime;
  nSiniestro, nOrden, nRecaida, nIDExpediente: TTableID;
  objSQL: TSQL;
  sCuit, sCUIL, sSql, sObservaciones, sTipoAcc, sFormatoRech, ifirmante, sArea: string;
  iIdFormatoRech: integer;
const
  msgError = 'No se han podido guardar los cambios a causa del siguiente error:' + #13 ;
  msgErrorDB = 'No se han podido guardar los cambios porque ocurrió un error no esperado en la base de datos.' + #13;
begin
  Verificar(not(Seguridad.Claves.IsActive('AltaSiniestroTercerizadoras')) and
            not(UsuarioAptoCarga(fraEX_CUIT.ID, dbdatetime)), btnNuevoSiniestro, '');

  Verificar((nTipoAlta > 0) and (not sdqConsulta.Active or sdqConsulta.IsEmpty), btnNuevoSiniestro,
            'No ha seleccionado ningún registro de la grilla.');

  Verificar((nTipoAlta = 1) and (sdqConsulta.FieldByName('EX_RECAIDA').AsInteger > 0), btnNuevoSiniestroMultiple,
            'No se puede abrir un orden de una recaída.');

  Verificar((nTipoAlta = 2) and AreIn(sdqConsulta.FieldByName('EX_CAUSAFIN').AsString, ['99','95']), btnNuevaRecaida,
            'No se puede abrir una recaída de un siniestro dado de baja por error en la carga o mal informado.');

  objSQL := TSQL.Create('SEX_EXPEDIENTES');
  chkReapDictContTto.Visible := False;  // TK 22620

  sTipoAcc := sdqConsulta.FieldByName('EX_TIPO').AsString;

  with fpAlta do
  try
    Tag := nTipoAlta;

    case nTipoAlta of
      0: // Siniestro
        begin
          Caption := 'Alta de Siniestros';
          lblFecha.Caption := 'Fecha accidente';
          sCuit := fraEX_CUIT.CUIT;
          sCUIL := fraEX_CUIL.CUIL;
          edSiniestro.Value := Obtener_MaxSiniestro(sCuit, DBDate) + 1;
          VCLExtra.LockControls(edSiniestro, True);
        end;
      1: // Orden
        begin
          Caption := 'Alta de Siniestros Múltiples';
          lblFecha.Caption := 'Fecha accidente';
          edSiniestro.Clear;
          edSiniestro.Value := sdqConsulta.FieldByName('ex_siniestro').AsInteger;
          VCLExtra.LockControls(edSiniestro, not sdqConsulta.FieldByName('ex_siniestro').IsNull);
          nSiniestro := sdqConsulta.FieldByName('ex_siniestro').AsInteger;
          edFecha.Date := sdqConsulta.FieldByName('ex_fechaaccidente').AsDateTime;
        end;
      2: // Recaída
        begin
          Caption := 'Alta de Recaídas';
          lblFecha.Caption := 'Fecha recaída';
          edSiniestro.Value := sdqConsulta.FieldByName('ex_siniestro').AsInteger;
          VCLExtra.LockControls(edSiniestro, not sdqConsulta.FieldByName('ex_siniestro').IsNull);
          chkReapDictContTto.Visible := True;  // TK 22620
          nSiniestro := sdqConsulta.FieldByName('ex_siniestro').AsInteger;
          nOrden     := sdqConsulta.FieldByName('ex_orden').AsInteger;
          edFecha.Clear;

          if Is_PEgresoControlPostAlta(nSiniestro, nOrden) then
            MsgBox('El siniestro posee un alta anterior con Control Post-Alta.');

          if Is_RecaidasSinAlta(nSiniestro, nOrden) then
            MsgBox('Existen recaídas anteriores sin fecha de alta médica.');

          if Is_SiniestroPatologiaCronica(nSiniestro, nOrden) then
            MsgBox('Existen recaídas anteriores asignadas al grupo de Patologías Crónicas.');

          if Is_SiniestroSinAltaReca(nSiniestro, nOrden) then
            MsgBox('El siniestro posee recaídas anteriores sin alta de Recalificación.');
        end;
    end;

    if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      sCuit := sdqConsulta.FieldByName('em_cuit').AsString;
      sCUIL := sdqConsulta.FieldByName('tj_cuil').AsString;
    end;

    MsgSiniestroPosibleRecupero(sCUIL, 0, 'S');

    fraEmpresaAlta.CUIT := sCuit;
    if nTipoAlta <> 1 then
    begin
      fraTrabajadorAlta.CUIL := sCUIL;

      sSql :=
        'SELECT tj_sexo' +
         ' FROM ctj_trabajador' +
        ' WHERE tj_cuil = :cuil';
      if (sCuil > '') and (ValorSQLEx(sSql, [sCuil]) = '') then
        MsgBox('No se ha informado el sexo del trabajador.');
    end
    else
      fraTrabajadorAlta.Clear;

    VCLExtra.LockControls(edFecha, nTipoAlta = 1);
    VCLExtra.LockControls(fraEmpresaAlta, nTipoAlta = 2);
    VCLExtra.LockControls(fraTrabajadorAlta, nTipoAlta = 2);
    //VCLExtra.LockControls(rgAccTransito, nTipoAlta = 2);
    if nTipoAlta = 2 then
      rgAccTransito.Enabled := false
    else
      rgAccTransito.Enabled := true;


    // Antes de devolver el resultado el ShowModal hace las validaciones...
    Result := (ShowModal = mrOk);
    flgGraba := False;

    if Result then
    repeat
      // Grabo el siniestro, orden o recaída correspondiente...
      Obtener_Proximos_Datos(nTipoAlta, edFecha.Date, dFechaAcc, dFechaRec, nSiniestro, nOrden, nRecaida, fraEmpresaAlta.CUIT);
      dFechaAux := Get_MaxFechaAltaMedica_x_Recaida(nSiniestro, nOrden, nRecaida);

      if (nTipoAlta = 2) and (dFechaAux > dFechaRec) then
        if not MsgAsk(Format('La máxima fecha de egreso %s para recaídas anteriores a la actual es posterior a la fecha de recaída que se está ingresando.' + CRLF + '¿Desea continuar?', [DateToStr(dFechaAux)])) then
          Abort;

      try
        BeginTrans;

        with objSQL do
        begin
          Fields.Clear;
          Fields.Add('ex_siniestro'          , nSiniestro);
          Fields.Add('ex_orden'              , nOrden);
          Fields.Add('ex_recaida'            , nRecaida);
          Fields.Add('ex_cuit'               , fraEmpresaAlta.CUIT);
          Fields.Add('ex_cuil'               , fraTrabajadorAlta.CUIL);
          Fields.Add('ex_usualta'            , Sesion.UserID);
          Fields.Add('ex_fechaaccidente'     , dFechaAcc);
          Fields.Add('ex_fecharecaida'       , dFechaRec);
          Fields.Add('ex_fechaalta'          , exDate);
          Fields.Add('ex_fechacarga'         , exDateTime);
          Fields.Add('ex_estado'             , '01'); //Estado Activo
//          Fields.Add('ex_gravedad'           , ' ');
          Fields.Add('ex_sector'             , Sesion.Sector);
          Fields.Add('ex_delegacion'         , Sesion.Delegacion);
          Fields.Add('ex_fechareasignacion'  , exDate);
          case rgAccTransito.ItemIndex of
            1: begin
                 Fields.Add('ex_accidentetransito'  , 'S');
                 Fields.Add('ex_posiblerecupero'  , 'S');
               end;
            2: Fields.Add('ex_accidentetransito'  , 'N');
          end;

          if nTipoAlta = 2 then
          begin
            Fields.Add('ex_tipo'             , sTipoAcc);
            Fields.Add('ex_reapdictconttto'  , String(IIF(chkReapDictContTto.Checked, 'S', 'N')) );
          end;

          if ExisteRelaLugarTrabajo(fraTrabajadorAlta.IdTrabajador) then    // TK 64558
            Fields.Add('ex_empleadopcp', 'S');
        end;

        case nTipoAlta of
          0: begin  // Siniestro
               sObservaciones := 'Apertura de un nuevo siniestro';
             end;
          1: begin  // Siniestro múltiple
               sObservaciones := 'Apertura de un nuevo siniestro múltiple';
               objSQL.Fields.Add('ex_siniestromultiple', 'S');
             end;
          2: begin  // Recaida
               sObservaciones := 'Apertura de una nueva recaída';

               sSql :=
                  'SELECT NVL(ex_siniestromultiple, ''N'')' +
                   ' FROM sex_expedientes' +
                  ' WHERE ex_siniestro = :siniestro' +
                    ' AND ex_orden = :orden' +
                    ' AND ex_recaida = 0';
               objSQL.Fields.Add('ex_siniestromultiple', VarToStr(ValorSQLEx(sSQL, [nSiniestro, nOrden])));
               objSQL.Fields.AddDate('ex_fechamanifestacion', sdqConsulta.FieldByName('ex_fechamanifestacion').AsDateTime);
               objSQL.Fields.AddDate('ex_fechaexpuesto', sdqConsulta.FieldByName('ex_fechaexpuesto').AsDateTime);
             end;
        end;

        sSql := 'SELECT art.afiliacion.check_cobertura(:cuit, :fecha) FROM DUAL';
        bPosibleRec := ValorSQLIntegerEx(sSQL, [fraEmpresaAlta.CUIT, TDateTimeEx.Create(dFechaAcc)]) <> 1; // Contrato Activo

        if rgAccTransito.ItemIndex <> 1 then    //si no es accidente de tránsito
          objSQL.Fields.Add('ex_posiblerecupero', String(IIF(bPosibleRec, 'S', 'N')));
          
        objSQL.Fields.Add('ex_posiblerechazo', String(IIF(bPosibleRec, 'S', 'N')));

        EjecutarSqlST(objSQL.InsertSql);

        if nTipoAlta = 1 then //Siniestro múltiple
        begin
          sSql :=
            'UPDATE sex_expedientes' +
              ' SET ex_siniestromultiple = :v1' +
            ' WHERE NVL(ex_siniestromultiple, :v2) <> :v3' +
              ' AND ex_siniestro = :v4';
          EjecutarSqlSTEx(sSQL, ['S', 'N', 'S', nSiniestro]);
        end;

        Actualizar_Historico_FondoHipoacusia(nSiniestro, nOrden, nRecaida, '', False);
        Grabar_RegAuditLog_Completo(nSiniestro, nOrden, nRecaida, 'ADM. TABLAS EXPEDIENTE',
                                    'ALTA', -1, '', '', '', '', '', '', '', False);


        //dFechaAux := Get_MaxFechaAltaMedica_x_Recaida(nSiniestro, nOrden, nRecaida);
        if not (dFechaAux + 180 > dFechaRec) then
        begin
          EnviarMailBD(Get_DireccionesEnvioMail('SIN_RECA6'),
                       '[Siniestro] Apertura de recaída ' + Armar_Siniestro(nSiniestro, nOrden, nRecaida), [oAutoFirma],
                       'La última recaída anterior al siniestro indicado data de mas de 6 meses atrás.', nil, 0, tcDefault, False);
        end;

        Result := True;
        flgGraba := True;

        tbLimpiar.Click;

        sSql :=
          'SELECT ex_id' +
           ' FROM sex_expedientes' +
          ' WHERE ex_siniestro = :siniestro' +
            ' AND ex_orden = :orden' +
            ' AND ex_recaida = :recaida';
        nIDExpediente := ValorSqlIntegerEx(sSql, [nSiniestro, nOrden, nRecaida]);


        dFechaRecepcion_EV := Get_FechaRecepcion_EV(nSiniestro, nOrden, dFechaRec);  // TK 22620    // TK 56561 (paso la fecha de recaida por parametro)
        if (nTipoAlta = 2) and chkReapDictContTto.Checked then
          Do_GenerarSolicitudAsistencia(dFechaRecepcion_EV, nIDExpediente, sTipoAcc);  // TK 22620

        GrabarHistoricoSector(nIDExpediente, False);
        Actualizar_GrupoDeTrabajo(nIDExpediente, False);

        InsertarReg_EstadoSiniestro(nSiniestro, nOrden, nRecaida, '01', sObservaciones, '', 0 {Fecha}, 0, 0, 0, False);

        if ValorSqlEx('select ex_causafin from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = ''0''', [nSiniestro, nOrden]) = '02' then
        begin
          if Is_SiniestroDeGobernacion(ValorSqlEx('select art.siniestro.get_idexpediente(:sin, :ord, ''0'') from dual', [nSiniestro, nOrden])) then   // cambie solo la funcion por la nueva, ya traia el idexpediente ahi y sin el true como segundo parametro!!
            sFormatoRech := 'R63G'
          else
            sFormatoRech := 'R63';

          ifirmante := ValorSqlEx('select art.siniestro.get_datoscartarechazo(:sin, :ord, ''I'') from dual', [nSiniestro, nOrden]);
          sArea := ValorSqlEx('select art.siniestro.get_datoscartarechazo(:sin, :ord, ''A'') from dual', [nSiniestro, nOrden]);

          iIdFormatoRech := ValorSqlEx('select tc_id from comunes.ctc_textocarta where tc_codigo = :cod', [sFormatoRech]);
          DoInsertarCarta(iIdFormatoRech, nSiniestro, nOrden, nRecaida, ifirmante, sArea, false, ART_EMPTY_ID);
          MsgBox('Se ha generado carta documento de rechazo para esta recaida ya que el siniestro original se encuentra rechazado');
        end;


//        fraEX_CUIT.CUIT := fraEmpresaAlta.CUIT;
        fraEX_CUIL.IdSiniestro := nIDExpediente;
        chkSiniestroCompleto.Checked := False;
        chkSiniestroRecaidas.Checked := False;
        OnFiltroChange(nil);
        btnAceptar.Click;
        CommitTrans;
      except
        on E: Exception do
        begin
          Rollback;

          if Pos( 'ORA', E.Message ) = 0 then
          begin
            if not MsgAsk(msgErrorDB + '¿Desea intentar grabar nuevamente?') then
              flgGraba := True;

            Result   := False;
          end else
          begin
            MsgBox(msgError + E.Message, MB_ICONEXCLAMATION);
            Result   := False;
            flgGraba := True;
          end;
        end;
      end;
    until flgGraba;
  finally
    objSQL.Free;
  end;
end;

procedure TfrmDlgBusSiniestro.dsConsultaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    edFechaAcc.Date := sdqConsulta.FieldByName('ex_fechaaccidente').AsDateTime
  else
    edFechaAcc.Date := 0;
end;

procedure TfrmDlgBusSiniestro.tbManTrabClick(Sender: TObject);
begin
  with TfrmContratoTrabajador.Create(Self) do
  try
    if fpAlta.Showing then
    begin
      if Self.fraTrabajadorAlta.IsSelected and Self.fraTrabajadorAlta.TieneSiniestro then
        CargarDatosTrabajador(Self.fraTrabajadorAlta.Value, Self.fraTrabajadorAlta.sdqDatos.FieldByName('rl_id').AsInteger)
      else if Self.fraTrabajadorAlta.IsSelected then
        BuscarTrabajadores(' tj_cuil = ' + SqlValue(Self.fraTrabajadorAlta.CUIL), 0)
      else
        DoCargarDatos(fraEmpresaAlta.Contrato);
    end
    else
    begin
      if Self.fraEX_CUIL.IsSelected and Self.fraEX_CUIL.TieneSiniestro then
        CargarDatosTrabajador(Self.fraEX_CUIL.Value, Self.fraEX_CUIL.sdqDatos.FieldByName('rl_id').AsInteger)
      else if Self.fraEX_CUIL.IsSelected then
        BuscarTrabajadores(' tj_cuil = ' + SqlValue(Self.fraEX_CUIL.CUIL), 0)
      else
        DoCargarDatos(fraEX_CUIT.Contrato);
    end;

    ShowModal;
    fraTrabajadorAlta.Reload;
    fraEX_CUIL.Reload;
  finally
    Free;
  end;
end;

procedure TfrmDlgBusSiniestro.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  OnFiltroChange(nil);
end;

procedure TfrmDlgBusSiniestro.OnAltaChange(Sender: TObject);
begin
  fraTrabajadorAlta.Contrato := fraEmpresaAlta.Contrato;
end;

procedure TfrmDlgBusSiniestro.fraEX_CUILtbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEX_CUIL.tbLimpiarClick(Sender);
  edFechaAccidente.Clear;
  edDG_NRODENUNCIASRT.Clear;
end;

procedure TfrmDlgBusSiniestro.fraEX_CUILcmbNombreDropDown(Sender: TObject);
var
  sAux1: String;
  sAux2: String;
begin
  inherited;
  
  if (fraEX_CUIT.IsSelected) and (fraEX_CUIL.Contrato <> fraEX_CUIT.Contrato) and (not fraEX_CUIL.IsFiltering) then
  begin
    sAux2 := fraEX_CUIL.Nombre;
    sAux1 := fraEX_CUIL.CUIL;
    fraEX_CUIL.Contrato := fraEX_CUIT.Contrato;
    fraEX_CUIL.CUIL := sAux1;
    fraEX_CUIL.Nombre := sAux2;
  end;
  fraEX_CUIL.cmbNombreDropDown(Sender);
end;

procedure TfrmDlgBusSiniestro.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tbPropiedades.Click;
  sdqConsulta.FindField('DG_NRODENUNCIASRT').EditMask := '!9999999\/9999;1;_';
end;

procedure TfrmDlgBusSiniestro.FSFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (UpperCase(Char(Key)) = 'T') then
    tbManTrab.Click
  else
    inherited;
end;

procedure TfrmDlgBusSiniestro.SetSoloConsulta(const Value :Boolean);
begin
  if (FSoloConsulta <> Value) then
  begin
    FSoloConsulta       := Value;
    pnlBotones.Visible  := not Value;
  end;
end;

procedure TfrmDlgBusSiniestro.edFechaAccidenteChange(Sender: TObject);
begin
  inherited;
  if Is_FechaValida(edFechaAccidente.Text) then
    OnFiltroChange(nil);
end;

procedure TfrmDlgBusSiniestro.edDG_NRODENUNCIASRTChange(Sender: TObject);
begin
  inherited;
  tbRefrescar.Enabled := fraEX_CUIL.IsSelected or fraEX_CUIT.IsSelected or Is_DenunciaSRT_Valida(edDG_NRODENUNCIASRT.EditText);
end;

procedure TfrmDlgBusSiniestro.edDG_NRODENUNCIASRTExit(Sender: TObject);
begin
{
  if Is_DenunciaSRT_Valida(edDG_NRODENUNCIASRT.EditText) then
    OnFiltroChange(nil);
}
end;

(*function TfrmDlgBusSiniestro.ValidaDictamenPagoDirecto: Boolean;
var
  sSql: String;
begin
  Result := True;
  if (edFecha.Date < (edFechaAccidente.Date + 365)) then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM sev_eventosdetramite, SIN.sei_eventoincapacidad' +
      ' WHERE ev_codigo = ei_codigo' +
        ' AND ev_siniestro = :siniestro' +
        ' AND ev_orden = :orden' +
        ' AND ev_fecha = :fecha' +
        ' AND ev_evento > 0' +
        ' AND ev_tratamiento = ''S''';
    if ExisteSqlEx(sSql, [edSiniestro.Value,
                          sdqConsulta.FieldByName('ex_orden').AsInteger,
                          TDateTimeEx.Create(edFecha.Date)]) then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM art.sle_liquiempsin' +
        ' WHERE le_siniestro = :siniestro' +
          ' AND le_orden = :orden' +
          ' AND le_tipoliqui = ''D''' +
          ' AND NVL(le_estado, '''') IN (''E'', ''P'')';
      if ExisteSqlEx(sSql, [edSiniestro.Value, sdqConsulta.FieldByName('ex_orden').AsInteger]) then
        Result := False;
    end;
  end;
end;*)

// TK 9290 Devuelve true si el trabajador posee un siniestro abierto y rechazado con la misma empresa,
// por no tener relación laboral con la misma. Es decir si se le enviaron ya las cartas LEG04 y/o LEG26
function TfrmDlgBusSiniestro.Posee_SinRechxNoRelLabEmpresa: Boolean;
var
  sSql: String;
  sdqAux: TSDQuery;
begin
  Result := False;

  sSql :=
    'SELECT ex_siniestro, ex_orden, ex_recaida, ex_causafin, tj_nombre' +
     ' FROM art.sex_expedientes, ctj_trabajador' +
    ' WHERE ex_cuil = tj_cuil' +
      ' AND ex_cuil = :cuil' +
      ' AND ex_cuit = :cuit' +    // para la misma empresa
      ' AND NVL(ex_causafin, '' '') = ''02''' +
      ' AND EXISTS (SELECT 1' +
                    ' FROM cca_carta' +
                   ' WHERE ca_idtrabajador = tj_id' +
                     ' AND ca_idtextocarta IN (685, 707))';
                               // y que posea las cartas de legales
  sdqAux := GetQueryEx(sSql, [fraTrabajadorAlta.CUIL, fraEmpresaAlta.CUIT]);
  with sdqAux do
  try
    if not sdqAux.Eof then
    begin
      Result := True;

      EnviarMailBD(Get_DireccionesEnvioMail('NORELLAB'),
                       '[Siniestros] Trabajador sin relación laboral con la Empresa ', [],
                       'Al trabajador ' + FieldByName('tj_nombre').AsString +
                       ', Nro CUIL '    + fraTrabajadorAlta.CUIL +
                       ', se le ha intentado cargar un siniestro, mientras que el mismo no posee relación laboral con la empresa (Nro de CUIT: ' +
                        fraEmpresaAlta.CUIT + '). ');

    end;
  finally
    Free;
  end;
end;

function TfrmDlgBusSiniestro.Validar_ReaperturaConDictamen(iSiniestro, iOrden: Integer): Boolean;  // TK 22620
var
  sSqlDict, sFechadict: String;
begin
  sFechadict := '';
  sSqlDict :=
    'SELECT ev_fecha' +
     ' FROM art.sev_eventosdetramite a, SIN.sei_eventoincapacidad b' +
    ' WHERE a.ev_siniestro = :sini' +
      ' AND a.ev_orden = :orden' +
      ' AND a.ev_codigo = b.ei_codigo' +
      ' AND (   (b.ei_tipoevento = 6)' +
           ' OR (a.ev_tratamiento = ''S''))' +
      ' AND a.ev_evento = (SELECT MAX(c.ev_evento)' +
                           ' FROM art.sev_eventosdetramite c, SIN.sei_eventoincapacidad d' +
                          ' WHERE c.ev_siniestro = a.ev_siniestro' +
                            ' AND c.ev_orden = a.ev_orden' +
                            ' AND c.ev_codigo = d.ei_codigo' +
                            ' AND (   (d.ei_tipoevento = 6)' +
                                 ' OR (c.ev_tratamiento = ''S'')))';
  sFechadict := ValorSqlEx(sSqlDict, [iSiniestro, iOrden]);
  Verificar(sFechadict = '', chkReapDictContTto, 'El Siniestro/Orden no posee evento de Dictámen Continúa Tto.');
  Verificar((ValorSqlDateTimeEx('select nvl(art.trabajador.get_fechaegresocontrato(:idtrab, :cont), art.actualdate + 1) from dual', [fraTrabajadorAlta.IdTrabajador, fraEmpresaAlta.Contrato]) < StrToDate(sFechadict)) and
           ( ValorSqlDateTimeEx('select ex_fechaaccidente from art.sex_expedientes where ex_siniestro = :sin and ex_orden = :ord and ex_recaida = 0', [iSiniestro, iOrden]) >
             ValorSqlDateTime('select trunc(sysdate) - 365 from dual')),
            chkReapDictContTto, 'El trabajador egresó de la empresa antes de la carga del dictamen');
  Result := True;
end;


procedure TfrmDlgBusSiniestro.Do_GenerarSolicitudAsistencia(aFechaRecep: TDateTime; aIdExpediente: Integer; aTipoAcc: String);     // TK 22620
var
  iSA_ID: Integer;
  sSql: String;
begin
  iSA_ID := GetSecNextVal('SIN.SEQ_SSA_ID');

  sSql :=
    'art.siniestro.do_insertarsolicitudasistencia(:idsolicitud, :idexpediente, NULL, NULL, NULL, NULL, NULL,' +
                                                ' ''Solicitud cargada desde la apertura de la Recaída'', NULL, NULL,' +
                                                ' NULL, NULL, TO_DATE(NULL), TO_DATE(NULL), TO_DATE(NULL),' +
                                                ' TO_DATE(NULL), NULL, NULL, NULL, NULL, NULL, NULL, :fecharecepcion,' +
                                                ' :usuario, NULL, NULL, NULL, ''N'', NULL, NULL, :tipoaccidente, NULL,' +
                                                ' NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,' +
                                                ' NULL, NULL);';
  EjecutarStoreSTEx(sSql, [iSA_ID, aIdExpediente, TDateTimeEx.Create(aFechaRecep), Sesion.UserID, aTipoAcc]);
end;

function TfrmDlgBusSiniestro.Get_FechaRecepcion_EV(aSiniestro,aOrden: Integer; dFechaRecaida: TDateTime): TDate;   // TK 22620
var
  sSqlDict: String;
  dFechaRecepcion: TDateTime;
begin
  sSqlDict :=
    'SELECT ev_fecharecepcion' +
     ' FROM art.sev_eventosdetramite a, SIN.sei_eventoincapacidad b' +
    ' WHERE a.ev_siniestro = :siniestro' +
      ' AND a.ev_orden = :orden' +
      ' AND a.ev_codigo = b.ei_codigo' +
      ' AND (   (b.ei_tipoevento = 6)' +
           ' OR (a.ev_tratamiento = ''S''))' +
      ' AND a.ev_evento = (SELECT MAX(c.ev_evento)' +
                           ' FROM art.sev_eventosdetramite c, SIN.sei_eventoincapacidad d' +
                          ' WHERE c.ev_siniestro = a.ev_siniestro' +
                            ' AND c.ev_orden = a.ev_orden' +
                            ' AND c.ev_codigo = d.ei_codigo' +
                            ' AND (   (d.ei_tipoevento = 6)' +
                                 ' OR (c.ev_tratamiento = ''S'')))';

  dFechaRecepcion := ValorSqlDateTimeEx(sSqlDict, [aSiniestro, aOrden]);

  if (dFechaRecepcion < dFechaRecaida) then   // TK 56561 (se tuvo que hacer esto, ya que si la fecha que daba como resultado aquí era menor a la de la nueva recaida, quedaba Inconsistente).
    Result := dFechaRecaida
  else
    Result := dFechaRecepcion;
end;

procedure TfrmDlgBusSiniestro.rgAccTransitoEnter(Sender: TObject);
begin
  if rgAccTransito.Enabled then
    with TRadioButton(rgAccTransito.Controls[0]) do
    begin
      SetFocus;
      //Checked := false;
    end;

end;

function TfrmDlgBusSiniestro.RecaOSiniAnteriorConAltaPorAbandono: Boolean;   // TK 57265
var iRecaida: integer;
    sSql: string;
begin
  Result   := False;
  iRecaida := ValorSqlEx('SELECT max(ex_recaida) ' +
                          ' FROM art.sex_expedientes ' +
                         ' WHERE ex_siniestro = :sini ' +
                           ' AND ex_orden = :orden ', [sdqConsulta.FieldByName('ex_siniestro').AsInteger, sdqConsulta.FieldByName('ex_orden').AsInteger]);   // TK 58381 (modifique los parametros)

  while (iRecaida >= 0) and not Result do
  begin
    sSql := 'SELECT pe_idtipodeegreso FROM sin.SPE_PARTEDEEGRESO ' +
            ' WHERE pe_idexpediente = art.siniestro.get_idexpediente(:sini, :orden, :recaida) ';

    Result := ( ValorSqlEx(sSql, [fraEX_CUIL.edSiniestro.Siniestro, fraEX_CUIL.edSiniestro.Orden, iRecaida]) = cTIPOEGRESO_ABANDONO );

    iRecaida := iRecaida - 1;
  end;
end;

end.
