unit unLiqAutomaticas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  unFraCodigoDescripcion, unFraCodDesc, unFraTrabajador, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, Mask, ToolEdit,
  DateComboBox, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ImgList, XPMenu,
  Placemnt, SortDlg, DB, SDEngine, SinEdit, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo, ShortCutControl, Buttons, FormPanel, unClassLiquidacion,
  Menus, QueryToFile, ExportDialog, unFraTrabajadorSiniestro, QueryPrint,
  artSeguridad, IntEdit, unFraGrupoTrabajo, RxToolEdit, RxPlacemnt;

type
  TfrmLiqAutomaticas = class(TfrmCustomForm)
    pnlTop: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbSeparador3: TToolButton;
    tbGenerar: TToolButton;
    tbTerminar: TToolButton;
    ToolButton5: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbSeparador4: TToolButton;
    tbSalir: TToolButton;
    gbCodLiq: TGroupBox;
    gbFechaAprobacion: TGroupBox;
    Label4: TLabel;
    edFechaGenDesde: TDateComboBox;
    edFechaGenHasta: TDateComboBox;
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox2: TGroupBox;
    fraTrabajador: TfraTrabajador;
    GroupBox3: TGroupBox;
    dgLiqAut: TArtDBGrid;
    sdqLiqAut: TSDQuery;
    dsLiqAut: TDataSource;
    sdLiqAut: TSortDialog;
    GroupBox4: TGroupBox;
    edSiniestro: TSinEdit;
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    cmbEstado: TDBCheckCombo;
    ShortCutControl: TShortCutControl;
    fpBajas: TFormPanel;
    Bevel2: TBevel;
    btnAceptarBaja: TBitBtn;
    btnCancelarBaja: TBitBtn;
    fraMotivoBaja: TfraCodDesc;
    Label1: TLabel;
    tbSuspender: TToolButton;
    ToolButton2: TToolButton;
    tbReactivar: TToolButton;
    tbNuevo: TToolButton;
    fpAlta: TFormPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    btnAceptarAlta: TBitBtn;
    btnCancelarAlta: TBitBtn;
    Label3: TLabel;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    fraConPagoAlta: TfraCodDesc;
    edSiniestroAlta: TSinEdit;
    lblTrabajador: TLabel;
    tbSugerencias: TToolButton;
    fpSugerencias: TFormPanel;
    Bevel3: TBevel;
    btnAceptarSug: TBitBtn;
    btnCancelarSug: TBitBtn;
    dgSugerencias: TArtDBGrid;
    dsSugerencias: TDataSource;
    sdqSugerencias: TSDQuery;
    ToolButton1: TToolButton;
    tbSugerenciasBaja: TToolButton;
    sdqSugerenciasBaja: TSDQuery;
    dsSugerenciasBaja: TDataSource;
    fpSugBaja: TFormPanel;
    Bevel4: TBevel;
    btnSugBaja: TBitBtn;
    btnCerrarSugBaja: TBitBtn;
    dgSugBaja: TArtDBGrid;
    Label6: TLabel;
    cmbConcepto: TDBCheckCombo;
    sdqConcepto: TSDQuery;
    dsConcepto: TDataSource;
    tbImprimir: TToolButton;
    ToolButton4: TToolButton;
    tbExportar: TToolButton;
    QueryPrint: TQueryPrint;
    ExportDialog: TExportDialog;
    cmbConceptoSug: TDBCheckCombo;
    btnRefrescarSug: TSpeedButton;
    mnuImprimir: TPopupMenu;
    mnuImpGrilla: TMenuItem;
    mnuImpLiquidacion: TMenuItem;
    Seguridad: TSeguridad;
    tbFechaCierre: TToolButton;
    ToolButton6: TToolButton;
    ToolButton3: TToolButton;
    fpFechaCierre: TFormPanel;
    btnCerrarFecha: TBitBtn;
    btnAceptarFecha: TBitBtn;
    edFechaCierre: TDateComboBox;
    Label87: TLabel;
    Bevel5: TBevel;
    pnlCierre: TPanel;
    btnImprimirSug: TBitBtn;
    qpSugBaja: TQueryPrint;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    edFechaImpDesde: TDateComboBox;
    edFechaImpHasta: TDateComboBox;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edFechaBajaDesde: TDateComboBox;
    edFechaBajaHasta: TDateComboBox;
    GroupBox7: TGroupBox;
    fraMotivoBajaFil: TfraCodDesc;
    Label9: TLabel;
    cmbConceptoBaja: TDBCheckCombo;
    btnRefrescarBaja: TSpeedButton;
    btnImprimirAlta: TBitBtn;
    qpSugAlta: TQueryPrint;
    tbBloqAsigFam: TToolButton;
    tbHabilitarAsigFam: TToolButton;
    ToolButton8: TToolButton;
    fpImprimirLiq: TFormPanel;
    gbCantCopias: TGroupBox;
    Label86: TLabel;
    Label5: TLabel;
    Label82: TLabel;
    edCantRec: TIntEdit;
    edCantRes: TIntEdit;
    edCantDig: TIntEdit;
    btnCerrarImp: TBitBtn;
    btnAceptarImp: TBitBtn;
    gbGrupoTrabajo: TGroupBox;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbTerminarClick(Sender: TObject);
    procedure btnAceptarBajaClick(Sender: TObject);
    procedure fpBajasBeforeShow(Sender: TObject);
    procedure tbSuspenderClick(Sender: TObject);
    procedure tbReactivarClick(Sender: TObject);
    procedure dgLiqAutGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbGenerarClick(Sender: TObject);
    procedure btnAceptarAltaClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure fpAltaBeforeShow(Sender: TObject);
    procedure edSiniestroAltaSelect(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbSugerenciasClick(Sender: TObject);
    procedure btnAceptarSugClick(Sender: TObject);
    procedure dgSugerenciasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dgSugBajaGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbSugerenciasBajaClick(Sender: TObject);
    procedure fpSugBajaBeforeShow(Sender: TObject);
    procedure btnSugBajaClick(Sender: TObject);
    procedure fpSugerenciasBeforeShow(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnRefrescarSugClick(Sender: TObject);
    procedure MnuImpGrillaClick(Sender: TObject);
    procedure mnuImpLiquidacionClick(Sender: TObject);
    procedure tbFechaCierreClick(Sender: TObject);
    procedure fpFechaCierreBeforeShow(Sender: TObject);
    procedure btnAceptarFechaClick(Sender: TObject);
    procedure sdqLiqAutAfterOpen(DataSet: TDataSet);
    procedure btnImprimirSugClick(Sender: TObject);
    procedure btnRefrescarBajaClick(Sender: TObject);
    procedure btnImprimirAltaClick(Sender: TObject);
    procedure tbBloqAsigFamClick(Sender: TObject);
    procedure tbHabilitarAsigFamClick(Sender: TObject);
    procedure btnAceptarImpClick(Sender: TObject);
  private
    oLiqui: TLiquidacion;
    dCierre: TDate;
    function GetCantSel(aEstado: array of String; bImpresion: Boolean = False): Integer;
    function IsSiniestroValido: Boolean;
    procedure DoGenerarLiqMortal(iSiniestro, iOrden, iRecaida, iConcepto, iIdCaso: Integer);
    procedure DoTerminarSuspender(IdEstado: Integer);
    procedure DoGenerarLiquidacion(iIdCaso, iConcepto, iIdExped, iSiniestro, iOrden,
                                   iRecaida, iIdEstado: Integer; sCuit, sCuil, sTipoLiq: String;
                                   bAsigFam: Boolean);
    procedure DoImprimirLiquidacion(iIdCaso, iSiniestro, iOrden, iRecaida,
                                    iNroLiq, iConcepto: Integer; sTipoLiq: String;
                                    iCantRec, iCantLiq, iCantDig: Integer);
    procedure SetIncapacidad(IdEvento: Integer; dDesde, dHasta: TDate; oLiqui: TILP);
    procedure DoBloquearAsigFam(bBloquear: Boolean);
    procedure DoImprimirLiqMortal(iSiniestro, iOrden, iRecaida :Integer);
    function GetNombreTrabCTJ(iIdExpediente :Integer): string;
  public
    { Public declarations }
  end;

var
  frmLiqAutomaticas: TfrmLiqAutomaticas;

implementation

uses unDmPrincipal, AnsiSql, CustomDlgs, unSesion, unPrincipal, General,
     DateTimeFuncs, unComunes, unClassExpediente, unSiniestros, DbFuncs,
     unRptLiqOtrosConceptos, unRptReciboOtrosConceptos, unDinerarias;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  sdqEstado.Open;
  sdqConcepto.Open;
  fraConPagoAlta.Propiedades.ExtraCondition := ' AND ((cp_espagomensual = ''S'') OR (cp_conpago IN (16, 56, 53))) ';
  with fraGrupoTrabajo do
  begin
    TableName := 'art.mgp_gtrabajo';
    FieldID := 'GP_CODIGO';
    FieldCodigo := 'GP_CODIGO';
    FieldDesc := 'GP_NOMBRE';
    FieldBaja := 'GP_FBAJA';
    ShowBajas := false;
    VerGestor := false;
  end;
  sSql := 'SELECT cl_fechabaja, cl_fechaalta ' +
           ' FROM sin.scl_casosliqautomaticas ' +
          ' WHERE cl_id = 0 '; //uso el 0 para no crear otra tabla al dope
  with GetQuery(sSql) do
  try
    if FieldByName('cl_fechaalta').AsDateTime < FirstLastDayOfMonth(DBDate) then
    begin   //limpio todos los casos generados y con error para el periodo actual
      sSql := 'UPDATE sin.scl_casosliqautomaticas ' +
                ' SET cl_estado = 1, ' + //pendiente
                    ' cl_observaciones = NULL, ' +
                    ' cl_fechaimpresion = NULL, ' +
                    ' cl_usuimpresion = NULL, ' +
                    ' cl_importegenerado = NULL, ' +
                    ' cl_nroliquidacion = NULL, ' +
                    ' cl_numpagocomi = NULL ' +
              ' WHERE cl_estado IN (4, 5) ' +
                ' AND cl_fechabaja IS NULL ';
      EjecutarSql(sSql);

      sSql := 'UPDATE sin.scl_casosliqautomaticas ' +
                ' SET cl_fechaalta = art.actualdate ' +
              ' WHERE cl_id = 0 ';
      EjecutarSql(sSql);
    end;
    if FieldByName('cl_fechabaja').AsDateTime >= FirstLastDayOfMonth(DBDate) then
    begin
      dCierre           := FieldByName('cl_fechabaja').AsDateTime;
      pnlCierre.Caption := 'Cierre actual: ' + FieldByName('cl_fechabaja').AsString;
    end else
      pnlCierre.Caption := 'Aún no se ha cerrado el mes';
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql := 'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                ' cp_denpago concepto, cp_titpago codconcepto, cl_fechaalta, ' +
                ' est.el_descripcion estado, cl_fechageneracion, cl_fechamodif, ' +
                ' ml_descripcion motivobaja, cl_fechabaja fbaja, em_nombre empresa, ' +
                ' art.utiles.armar_cuit(em_cuit) cuit, tj_nombre trabajador, ' +
                ' art.utiles.armar_cuit(tj_cuil) cuil, cl_id, cl_estado, ' +
                ' ex_siniestro, ex_orden, ex_recaida, em_cuit, tj_cuil, cl_conpago, ' +
                ' cl_tipoliq, cl_observaciones, ex_id, cl_importegenerado,  ' +
                ' cl_nroliquidacion, cl_fechaimpresion, cl_bloquearasigfam, ' +
                ' cl_numpagocomi, gp_nombre, siniestro.is_recalificacion(ex_id) recalificacion, ' +
                ' del.el_nombre el_nombre ' +
           ' FROM SIN.scl_casosliqautomaticas, art.sex_expedientes, art.scp_conpago, ' +
                ' SIN.sel_estadosliqautomaticas est, SIN.sml_motivobajaliqaut, aem_empresa, ' +
                ' ctj_trabajador, art.mgp_gtrabajo, art.del_delegacion del ' +
          ' WHERE NVL(cl_idexpediente, '''') = ex_id ' +
            ' AND cl_conpago = cp_conpago ' +
            ' AND cl_estado = est.el_id ' +
            ' AND cl_idmotivobaja = ml_id(+) ' +
            ' AND ex_cuit = em_cuit ' +
            ' AND ex_cuil = tj_cuil ' +
            ' AND ex_gtrabajo = gp_codigo ' +
            ' AND ex_delegacion = del.el_id';

  if not edSiniestro.IsEmpty then
    sSql := sSql + ' AND ex_id = art.siniestro.get_idexpediente(' + SqlInt(edSiniestro.Siniestro) + ',' +
                                                                    SqlInt(edSiniestro.Orden) + ',' +
                                                                    SqlInt(edSiniestro.Recaida) + ')';

  if not edFechaGenDesde.IsEmpty then
    sSql := sSql + ' AND cl_fechageneracion >= ' + SqlDate(edFechaGenDesde.Date);

  if not edFechaGenHasta.IsEmpty then
    sSql := sSql + ' AND cl_fechageneracion <= ' + SqlDate(edFechaGenHasta.Date);

  if not edFechaImpDesde.IsEmpty then
    sSql := sSql + ' AND cl_fechaimpresion >= ' + SqlDate(edFechaImpDesde.Date);

  if not edFechaImpHasta.IsEmpty then
    sSql := sSql + ' AND cl_fechaimpresion <= ' + SqlDate(edFechaImpHasta.Date);

  if not edFechaBajaDesde.IsEmpty then
    sSql := sSql + ' AND cl_fechabaja >= ' + SqlDate(edFechaBajaDesde.Date);

  if not edFechaBajaHasta.IsEmpty then
    sSql := sSql + ' AND cl_fechabaja <= ' + SqlDate(edFechaBajaHasta.Date);

  if not(fraMotivoBajaFil.IsEmpty) then
    sSql := sSql + ' AND cl_idmotivobaja = ' + SqlInt(fraMotivoBajaFil.ID);

  if cmbConcepto.Text <> '' then
    sSql := sSql + ' AND cp_conpago ' + cmbConcepto.InSql;

  if not fraEmpresa.IsEmpty then
    sSql := sSql + ' AND ex_contrato = ' + SqlInt(fraEmpresa.Contrato);

  if not fraTrabajador.IsEmpty then
    sSql := sSql + ' AND ex_cuil = ' + SqlValue(fraTrabajador.CUIL);

  if cmbEstado.Text <> '' then
    sSql := sSql + ' AND cl_estado ' + cmbEstado.InSql;

  if not fraGrupoTrabajo.IsEmpty then
    sSql := sSql + ' AND gp_codigo =' + sqlvalue(fraGrupoTrabajo.ID);

  sSql := sSql + sdLiqAut.OrderBy;

  sdqLiqAut.Close;
  sdqLiqAut.SQL.Text := sSql;
  sdqLiqAut.Open;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edSiniestro.Clear;
  edFechaGenDesde.Clear;
  edFechaGenHasta.Clear;
  edFechaImpDesde.Clear;
  edFechaImpHasta.Clear;
  edFechaBajaDesde.Clear;
  edFechaBajaHasta.Clear;
  fraMotivoBajaFil.Clear;
  cmbEstado.Clear;
  cmbConcepto.Clear;
  fraTrabajador.Clear;
  fraEmpresa.Clear;
  sdqLiqAut.Close;
  fraGrupoTrabajo.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbOrdenarClick(Sender: TObject);
begin
  sdLiqAut.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbTerminarClick(Sender: TObject);
var
  iCant: Integer;
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) and (dgLiqAut.SelectedRows.Count > 0) then
  begin
    iCant := GetCantSel(['1', '2', '4', '5']);
    Verificar((iCant = 0), Nil, 'No se ha seleccionado ningún caso en condiciones de terminar.');
    if MsgAsk('Se ha/n seleccionado ' + IntToStr(iCant) + ' caso/s en condiciones de terminar, ¿Desea continuar?') and
      (fpBajas.ShowModal = mrOk) then
    DoTerminarSuspender(3);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnAceptarBajaClick(Sender: TObject);
begin
  Verificar(fraMotivoBaja.IsEmpty, fraMotivoBaja, 'Debe seleccionar un motivo.');
  fpBajas.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.fpBajasBeforeShow(Sender: TObject);
begin
  fraMotivoBaja.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.DoTerminarSuspender(IdEstado: Integer);
var
  i: Integer;
  sSql: String;
begin
  try
    sSql := 'UPDATE SIN.scl_casosliqautomaticas ' +
              ' SET cl_estado = :Estado, ' +
                  ' cl_fechabaja = art.actualdate, ' +
                  ' cl_usubaja = :Usuario, ' +
                  ' cl_idmotivobaja = :IdMotivo ' +
            ' WHERE cl_id = :ID ';
    if (IdEstado = 3) then
      sSql := sSql +  ' AND cl_estado IN (1, 2, 4, 5) '
    else
      sSql := sSql +  ' AND cl_estado IN (1, 4, 5) ';

    BeginTrans;
    for i := 0 to dgLiqAut.SelectedRows.Count - 1 do
    begin
      sdqLiqAut.GotoBookmark(pointer(dgLiqAut.SelectedRows.Items[i]));
      EjecutarSqlSTEx(sSql, [IdEstado, Sesion.UserID, fraMotivoBaja.ID, sdqLiqAut.FieldByName('cl_id').AsInteger]);
    end;
    CommitTrans;
    sdqLiqAut.Refresh;
    dgLiqAut.UnselectAll;    
  except
    on E:Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar terminar/suspender.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbSuspenderClick(Sender: TObject);
var
  iCant: Integer;
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) and (dgLiqAut.SelectedRows.Count > 0) then
  begin
    iCant := GetCantSel(['1', '4', '5']);
    Verificar((iCant = 0), Nil, 'No se ha seleccionado ningún caso en condiciones de suspender.');
    if MsgAsk('Se ha/n seleccionado ' + IntToStr(iCant) + ' caso/s en condiciones de suspender, ¿Desea continuar?') and
      (fpBajas.ShowModal = mrOk) then
    DoTerminarSuspender(2);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAutomaticas.GetCantSel(aEstado: array of String; bImpresion: Boolean = False): Integer;
var
  i: Integer;
  APointer: TBookMark;
begin
  with sdqLiqAut do
  begin
    APointer := GetBookmark;
    DisableControls;
    First;
    i := 0;
    while not Eof do
    begin
      if dgLiqAut.SelectedRows.CurrentRowSelected and
         AreIn(FieldByName('cl_estado').AsString, aEstado) and
         (not(bImpresion) or
          (bImpresion and FieldByName('cl_fechaimpresion').IsNull) or
          (bImpresion and not(FieldByName('cl_fechaimpresion').IsNull) and Seguridad.Claves.IsActive('ReimprimirLiq')))
      then
        Inc(i);
      Next;
    end;
    EnableControls;
    GotoBookmark(APointer);
  end;
  Result := i;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbReactivarClick(Sender: TObject);
var
  i, iSusp: Integer;
  sSql: String;
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) and (dgLiqAut.SelectedRows.Count > 0) then
  begin
    iSusp := GetCantSel(['2']);
    Verificar((iSusp = 0), Nil, 'No se ha seleccionado ningún caso suspendido para reactivar.');
    if MsgAsk('Se ha/n seleccionado ' + IntToStr(iSusp) + ' caso/s suspendidos/s para reactivar, ¿Desea continuar?') then
    try
      sSql := 'UPDATE SIN.scl_casosliqautomaticas ' +
                ' SET cl_estado = 1, ' +
                  ' cl_fechabaja = Null, ' +
                  ' cl_usubaja = Null, ' +
                  ' cl_idmotivobaja = Null, ' +
                  ' cl_fechamodif = art.actualdate, ' +
                  ' cl_usumodif = :Usuario ' +
            ' WHERE cl_id = :ID ' +
              ' AND cl_estado = 2 ';
      BeginTrans;
      for i := 0 to dgLiqAut.SelectedRows.Count - 1 do
      begin
        sdqLiqAut.GotoBookmark(pointer(dgLiqAut.SelectedRows.Items[i]));
        EjecutarSqlSTEx(sSql, [Sesion.UserID, sdqLiqAut.FieldByName('cl_id').AsInteger]);
      end;
      CommitTrans;
      sdqLiqAut.Refresh;
      dgLiqAut.UnselectAll;
    except
      on E:Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al intentar reactivar.');
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.dgLiqAutGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (Field.DataSet.FieldByName('cl_estado').AsString = '2') then
    AFont.Color := clMaroon
  else if (Field.DataSet.FieldByName('cl_estado').AsString = '3') then
    AFont.Color := clRed
  else
   AFont.Color := clBlack;

  Background  := IIF(dgLiqAut.SelectedRows.CurrentRowSelected, clLtGray, clWhite);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbGenerarClick(Sender: TObject);
var
  i, iCant: Integer;
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) and (dgLiqAut.SelectedRows.Count > 0) then
  begin
    Verificar((dCierre > 0) and (dCierre < DBDate) and not(Seguridad.Claves.IsActive('GenerarCerrados')),
              pnlCierre, 'Ya se ha superado la fecha de cierre del período actual.');
    iCant := GetCantSel(['1', '4', '5']); //estado pendiente, generado ó con error
    Verificar((iCant = 0), Nil, 'No se ha seleccionado ningún caso en condiciones de generar liquidación.');
    if MsgAsk('Se ha/n seleccionado ' + IntToStr(iCant) + ' caso/s en condiciones de generar, ' + #13 +
              '¿Confirma la generación de éstos casos para el periodo actual?') then
    with sdqLiqAut do
    try
      BeginTrans;
      for i := 0 to dgLiqAut.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(dgLiqAut.SelectedRows.Items[i]));
        if AreIn(FieldByName('cl_estado').AsString, ['1', '4', '5']) then
          DoGenerarLiquidacion(FieldByName('cl_id').AsInteger, FieldByName('cl_conpago').AsInteger,
                               FieldByName('ex_id').AsInteger, FieldByName('ex_siniestro').AsInteger,
                               FieldByName('ex_orden').AsInteger, FieldByName('ex_recaida').AsInteger,
                               FieldByName('cl_estado').AsInteger, FieldByName('em_cuit').AsString,
                               FieldByName('tj_cuil').AsString, FieldByName('cl_tipoliq').AsString,
                               FieldByName('cl_bloquearasigfam').AsString = 'N');
      end;
      CommitTrans;
      dgLiqAut.UnselectAll;      
      sdqLiqAut.Refresh;
    except
      on E:Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al intentar reactivar.');
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.DoGenerarLiquidacion(iIdCaso, iConcepto, iIdExped, iSiniestro, iOrden,
                                                  iRecaida, iIdEstado: Integer; sCuit, sCuil, sTipoLiq: String;
                                                  bAsigFam: Boolean);

var
  sSql, sObser, sCampo, sExtra: String;
  iResValida, iEstado: Integer;
  dDesde, dHasta: TDate;
  bExiste, bEsMortal: Boolean;
begin
  bExiste     := False;
  iResValida  := 0;
  dDesde      := FirstLastDayOfMonth(DBDate);
  bEsMortal   := IIF(IntToStr(iConcepto) = CONCEPTO_MUERTE_ANTICIPO, True, False);

  if bEsMortal then
  begin
    DoGenerarLiqMortal(iSiniestro, iOrden, iRecaida, iConcepto, iIdCaso);
    Exit;
  end
  else  if (sTipoLiq = 'L') then //si estamos en ILT.
  begin
    DoLiberarLiquidacion(oLiqui);
    oLiqui        := TILT.Create(iSiniestro, iOrden, iRecaida, 0, True, True, True, True, True, True, True, True);
    oLiqui.Tipo   := IIF(IntToStr(iConcepto) = CONCEPTO_ILT_PAGODIRECTO, 'D', 'L');
  end
  else begin  //si estamos en ILP.
    DoLiberarLiquidacion(oLiqui);
    oLiqui          := TILP.Create(iSiniestro, iOrden, iRecaida, 0, True, True);
    oLiqui.Tipo     :=  'I';
  end;

  sSql := 'SELECT le_delegacion, le_metodopago, le_enviofondos, le_idbanco, le_tipoenviofondos, ' +
                ' le_idenviofondos, le_chequenombre, le_recibos, NVL(le_porcincapacidad, 0) porcinca, ' +
                ' le_comentario, le_ideventoinca, le_subtotalnorem ' +
           ' FROM sle_liquiempsin ' +
          ' WHERE le_siniestro = :Sin ' +
            ' AND le_orden = :Ord ' +
            ' AND le_recaida = :Reca ' +
            ' AND le_conpago = :Concepto ' +
            ' AND le_fechahas = :Fhasta ' +
            ' AND NVL(le_estado, '''') IN (''C'',''M'',''E'',''P'',''V'') ' +
       ' ORDER BY le_numliqui DESC ';
  with GetQueryEx(sSql, [iSiniestro, iOrden, iRecaida, iConcepto, TDateTimeEx.Create(dDesde-1)]) do
  try
    if Eof then
    begin
      iResValida := 2;
      sObser     := 'No se ha encontrado la liquidación correspondiente al mes anterior.';
    end
    else begin
      dHasta  := ValorSqlDateTimeEx('SELECT art.liq.get_hastaliqaut(:IdExped, :IdEvento, :Desde, :Porc, :Tipo) ' +
                                     ' FROM dual', [iIdExped, FieldByName('le_ideventoinca').AsInteger,
                                                    TDateTimeEx.Create(dDesde), FieldByName('porcinca').AsFloat, sTipoLiq]);
      sSql := 'SELECT 1 ' +
               ' FROM sle_liquiempsin ' +
              ' WHERE le_siniestro = :Sin ' +
                ' AND le_orden = :Ord ' +
                ' AND le_recaida = :Reca ' +
                ' AND le_conpago = :Concepto ' +
                ' AND le_fechades = :Desde ' +
                ' AND le_fechahas = :Hasta ' +
                ' AND NVL(le_estado, '''') IN (''C'',''M'',''E'',''P'',''V'') ' +
                ' AND le_tipoliqui NOT IN (''W'',''X'',''Y'',''Z'') ';
      bExiste := ExisteSqlEx(sSql, [iSiniestro, iOrden, iRecaida, iConcepto,
                                    TDateTimeEx.Create(dDesde), TDateTimeEx.Create(dHasta)]);

      if not bExiste then
      begin
        if (oLiqui is TILP) then
          SetIncapacidad(FieldByName('le_ideventoinca').AsInteger, dDesde, dHasta, TILP(oLiqui));

        oLiqui.Desde         := dDesde;
        oLiqui.Hasta         := dHasta;
        oLiqui.Delegacion    := FieldByName('le_delegacion').AsString;
        oLiqui.MetodoPago    := FieldByName('le_metodopago').AsString;
        oLiqui.EnvioFondos   := FieldByName('le_enviofondos').AsString;
        oLiqui.IdBanco       := FieldByName('le_idbanco').AsInteger;
        oLiqui.TipoFondos    := FieldByName('le_tipoenviofondos').AsString;
        oLiqui.CodigoFondos  := FieldByName('le_idenviofondos').AsInteger;

       // if EsChequeANombreTrabajador(oLiqui.MetodoPago, IntToStr(oLiqui.IdBanco)) then   // TK 47963
        if (oLiqui.MetodoPago <> '') and (oLiqui.IdBanco <> 0) and (ValorSql('SELECT art.dinerarias.is_chequealtrabajador(' + SqlValue(oLiqui.MetodoPago) + ',' + SqlValue(IntToStr(oLiqui.IdBanco)) + ') from dual ') = 'S') then
        begin
          //msgbox('es al trabajador : ' + FieldByName('le_chequenombre').AsString);  // hacer
          oLiqui.ANombreDe := GetNombreTrabCTJ(iIdExped);
        end
        else
          oLiqui.ANombreDe  := FieldByName('le_chequenombre').AsString;

        oLiqui.ANombreDe     := FieldByName('le_chequenombre').AsString;
        oLiqui.Observaciones := FieldByName('le_comentario').AsString;
        oLiqui.Recibos       := FieldByName('le_recibos').AsString;
        if (oLiqui is TILT) then
          TILT(oLiqui).ImporteLiquidNoRem := FieldByName('le_subtotalnorem').AsCurrency;

        if bAsigFam then
        begin
          oLiqui.AsgnFamiliares.CalcularMontos(oLiqui.Expediente.Id, IIF((oLiqui is TILP), 'ILP', 'ILT'),
                                               dDesde, dHasta, oLiqui.ImporteLiquidado);
          oLiqui.SalarioFamiliar := oLiqui.AsgnFamiliares.SalarioFamiliarTotal;
        end;

        if oLiqui.Message <> '' then iResValida := 2;
      end;
    end;
  finally
    Free;
  end;

  if not(bExiste) and (iResValida <> 2) then iResValida := oLiqui.Validar;

  if bExiste then
  begin
    iEstado := iIdEstado; //dejo el que estaba...
    sObser  := 'Ya se ha generado la liquidación correspondiente al mes.';
    sCampo  := 'cl_fechamodif';
  end
  else if iResValida = 2 then // si es alguna validación que requiera el dato obligatoriamente siempre
  begin
    iEstado := 5;
    sObser  := NVL(sObser, oLiqui.Error);
    sCampo  := 'cl_fechamodif';
  end
  else begin
    oLiqui.Grabar;
    iEstado  := 4;
    sCampo   := 'cl_fechageneracion';
    sExtra   := ', cl_importegenerado = ' + SqlNumber(oLiqui.TotalAPagar) +
                ', cl_nroliquidacion = ' + SqlInt(oLiqui.NroLiquidacion);
  end;

  sSql := 'UPDATE SIN.scl_casosliqautomaticas ' +
            ' SET cl_estado = :Estado, ' +
                 sCampo + ' = art.actualdate, ' +
              ' cl_usumodif = :Usuario, ' +
              ' cl_observaciones = :Obs ' + sExtra +
        ' WHERE cl_id = :ID ';
  EjecutarSqlSTEx(sSql, [iEstado, Sesion.UserID, sObser, iIdCaso]);

end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnAceptarAltaClick(Sender: TObject);
var
  sSql, sMotivo: String;
begin
  Verificar(edSiniestroAlta.IsEmpty, edSiniestroAlta, 'Debe ingresar el siniestro.');
  Verificar(fraConPagoAlta.IsEmpty, fraConPagoAlta, 'Debe seleccionar el concepto de pago.');

  sMotivo := ValorSqlEx('SELECT siniestro.get_motivocierre(:IdExpediente) ' +
                        'FROM dual', [Get_IdExpediente(edSiniestroAlta.Siniestro,
                                                       edSiniestroAlta.Orden,
                                                       edSiniestroAlta.Recaida)]);
  Verificar((sMotivo <> ''), edSiniestroAlta, 'No se puede liquidar este siniestro ya que se encuentra cerrado ' + sMotivo + '.');

  sSql := 'SELECT 1 ' +
           ' FROM sle_liquiempsin ' +
          ' WHERE le_siniestro = :Sin ' +
            ' AND le_orden = :Ord ' +
            ' AND le_recaida = :Reca ' +
            ' AND le_fechahas = :Fhasta ' +
            ' AND le_conpago = :Concepto ' +
            ' AND NVL(le_estado, '''') IN (''C'',''M'',''E'',''P'',''V'') ' +
       ' ORDER BY le_numliqui DESC ';
  Verificar(not ExisteSqlEx(sSql, [edSiniestroAlta.Siniestro, edSiniestroAlta.Orden,
                                   edSiniestroAlta.Recaida,
                                   TDateTimeEx.Create(FirstLastDayOfMonth(DBDate)-1),
                                   fraConPagoAlta.ID]), fraConPagoAlta,
          'No se ha encontrado la liquidación correspondiente al mes anterior para el concepto seleccionado.');

  fpAlta.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.mnuMarcarTodosClick(Sender: TObject);
begin
  dgLiqAut.SelectAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.mnuDesmarcarTodosClick(Sender: TObject);
begin
  dgLiqAut.UnselectAll;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.SetIncapacidad(IdEvento: Integer; dDesde, dHasta: TDate; oLiqui: TILP);
var
  sSql: String;
begin
  sSql := 'SELECT ev_codigo, ev_porcincapacidad, ' +
                ' DECODE(ex_gravedad, ''5'', ''M'', DECODE(ev_graninc, ''S'', ''G'', ev_grado)) ev_grado, ' +
                ' NVL(cp_caracter, DECODE(ex_gravedad, ''5'', '' '', ev_caracter)) ev_caracter ' +
           ' FROM sev_eventosdetramite, sex_expedientes, sle_liquiempsin, scp_conpago ' +
          ' WHERE ev_idexpediente = ex_id ' +
            ' AND ev_idevento = le_ideventoinca(+) ' +
            ' AND le_conpago = cp_conpago ' +
            ' AND ev_idevento = :IdEv ' +
            ' AND NVL(le_estado, '''') IN (''C'',''M'',''E'',''P'',''V'') ' +
            ' AND le_tipoliqui NOT IN (''W'',''X'',''Y'',''Z'') ' +
            ' AND le_fechahas(+) = :Hasta ';

  with GetQueryEx(sSql, [IdEvento, TDateTimeEx.Create(dDesde - 1)]) do
  try
    oLiqui.SetIncapacidad(IdEvento, FieldByName('ev_codigo').AsString, FieldByName('ev_grado').AsString,
                          FieldByName('ev_caracter').AsString, FieldByName('ev_porcincapacidad').AsCurrency,
                          dDesde, dHasta);
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.fpAltaBeforeShow(Sender: TObject);
begin
  edSiniestroAlta.Clear;
  fraConPagoAlta.Clear;
  lblTrabajador.Caption := '';
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.edSiniestroAltaSelect(Sender: TObject);
var
  sSql: String;
begin
  lblTrabajador.Caption := '';
  if edSiniestroAlta.IsEmpty then Exit;
  if IsSiniestroValido then
  begin
    sSql := 'SELECT tj_nombre || '' - '' || ex_fechaaccidente ' +
             ' FROM sex_expedientes, ctj_trabajador ' +
            ' WHERE ex_cuil = tj_cuil ' +
              ' AND ex_siniestro = :Sini '  +
              ' AND ex_orden = :Orden ' +
              ' AND ex_recaida = :Reca ';
    lblTrabajador.Caption := ValorSqlEx(sSql, [edSiniestroAlta.Siniestro, edSiniestroAlta.Orden, edSiniestroAlta.Recaida]);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbNuevoClick(Sender: TObject);
var
  sSql: String;
  iIdExped: Integer;
begin
  if (fpAlta.ShowModal = mrOk) then
  begin
    iIdExped := ValorSqlIntegerEx('SELECT ex_id FROM sex_expedientes ' +
                                  ' WHERE ex_siniestro = :Sin ' +
                                    ' AND ex_orden = :Ord ' +
                                    ' AND ex_recaida = :Reca', [edSiniestroAlta.Siniestro,
                                                                edSiniestroAlta.Orden,
                                                                edSiniestroAlta.Recaida]);
    sSql := 'INSERT INTO sin.scl_casosliqautomaticas ' +
            '(cl_idexpediente, cl_conpago, cl_estado, cl_tipoliq, cl_usualta, cl_fechaalta) VALUES (' +
            SqlInt(iIdExped) + ',' + SqlInt(fraConPagoAlta.ID) + ', 1, ' +
            IIF(AreIn(fraConPagoAlta.sdqDatos.FieldByName('cp_tipo').AsString, ['P', 'M']), '''I''', '''L''') + ',' +
            SqlValue(Sesion.UserID) + ', actualdate)';
    EjecutarSql(sSql);
    if sdqLiqAut.Active then sdqLiqAut.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAutomaticas.IsSiniestroValido: Boolean;
var
  sSql: String;
  iSin, iOrd, iReca: Integer;
begin
  iSin   := edSiniestroAlta.Siniestro;
  iOrd   := edSiniestroAlta.Orden;
  iReca  := edSiniestroAlta.Recaida;

  sSql   := 'SELECT 1 FROM sex_expedientes ' +
            ' WHERE ex_siniestro = :Sini ' +
              ' AND ex_orden = :Orden ' +
              ' AND ex_recaida = :Reca';
  if not(ExisteSqlEx(sSql, [iSin, iOrd, iReca])) then
  begin
    edSiniestroAlta.Clear;
    Verificar(True, edSiniestroAlta, 'El Siniestro seleccionado no existe, por favor ingrese uno válido');
  end;

  sSql := 'SELECT NVL(ex_causafin, '' '') FROM sex_expedientes ' +
          ' WHERE ex_siniestro = :Sini ' +
            ' AND ex_orden = :Orden ' +
            ' AND ex_recaida = :Reca';
  if AreIn(ValorSqlEx(sSql, [iSin, iOrd, iReca]), ['02', '99', '95']) then
  begin
    edSiniestroAlta.Clear;
    Verificar(True, edSiniestroAlta, 'El Siniestro seleccionado se encuentra rechazado ó cerrado por error de carga.');
  end;

  Result := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbSugerenciasClick(Sender: TObject);
begin
  fpSugerencias.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnAceptarSugClick(Sender: TObject);
var
  sSql: String;
  i: Integer;
begin
  if sdqSugerencias.Active and not(sdqSugerencias.IsEmpty) and (dgSugerencias.SelectedRows.Count > 0) and
     MsgAsk('¿Confirma la inclusión de los registros seleccionados para la liquidación automática?') then
    with sdqSugerencias do
    try
      BeginTrans;
      for i := 0 to dgSugerencias.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(dgSugerencias.SelectedRows.Items[i]));
        sSql := 'INSERT INTO sin.scl_casosliqautomaticas ' +
                '(cl_idexpediente, cl_conpago, cl_estado, cl_tipoliq, cl_usualta, cl_fechaalta) VALUES (' +
                  SqlInt(FieldByName('ex_id').AsInteger) + ',' +
                  SqlInt(FieldByName('le_conpago').AsInteger) + ', 1, ' +
                  IIF(FieldByName('cp_tipo').AsString = 'P', '''I''', '''L''') + ',' +
                  SqlValue(Sesion.UserID) + ', actualdate)';
        EjecutarSqlST(sSql);
      end;
      CommitTrans;
      Close;
      if sdqLiqAut.Active then sdqLiqAut.Refresh;
      fpSugerencias.Close;
    except
      on E:Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al intentar insertar sugerencias.');
      end;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.dgSugerenciasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  Background  := IIF(dgSugerencias.SelectedRows.CurrentRowSelected, clLtGray, clWhite);
  AFont.Color := IIF(dgSugerencias.SelectedRows.CurrentRowSelected, clWhite, clBlack);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.dgSugBajaGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  Background  := IIF(dgSugBaja.SelectedRows.CurrentRowSelected, clLtGray, clWhite);
  AFont.Color := IIF(dgSugBaja.SelectedRows.CurrentRowSelected, clWhite, clBlack);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbSugerenciasBajaClick(Sender: TObject);
begin
  fpSugBaja.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.fpSugBajaBeforeShow(Sender: TObject);
begin
  cmbConceptoBaja.Clear;
  sdqSugerenciasBaja.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnSugBajaClick(Sender: TObject);
var
  sSql: String;
  i: Integer;
begin
  if sdqSugerenciasBaja.Active and not(sdqSugerenciasBaja.IsEmpty) and (dgSugBaja.SelectedRows.Count > 0) and
     MsgAsk('¿Confirma la BAJA de los registros seleccionados?') then
    with sdqSugerenciasBaja do
    try
      BeginTrans;
      for i := 0 to dgSugBaja.SelectedRows.Count - 1 do
      begin
        dgSugBaja.DataSource.DataSet.GotoBookmark(pointer(dgSugBaja.SelectedRows.Items[0]));
        sSql := 'UPDATE SIN.scl_casosliqautomaticas ' +
                  ' SET cl_estado = 3, ' +
                      ' cl_fechabaja = art.actualdate, ' +
                      ' cl_usubaja = :Usuario, ' +
                      ' cl_idmotivobaja = :IdMot ' +
                ' WHERE cl_id = :ID ';
        EjecutarSqlSTEx(sSql, [Sesion.UserID, FieldByName('bl_idmotivo').AsInteger, FieldByName('bl_idcaso').AsInteger]);
        dgSugBaja.ToggleRowSelection;
      end;
      CommitTrans;
      Close;
      if sdqLiqAut.Active then sdqLiqAut.Refresh;
      dgSugerencias.UnselectAll;
      fpSugBaja.Close;
    except
      on E:Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al intentar dar de baja sugerencias.');
      end;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.fpSugerenciasBeforeShow(Sender: TObject);
begin
  cmbConceptoSug.Clear;
  sdqSugerencias.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbExportarClick(Sender: TObject);
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) then
    ExportDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnRefrescarSugClick(Sender: TObject);
var
  sSql: String;
begin
  sdqSugerencias.Close;
  if (cmbConceptoSug.Text <> '') then
  begin
    sSql :='SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                 ' cp_titpago codconcepto, tj_nombre trabajador, ex_id, le_conpago, cp_tipo, ' +
                 ' art.utiles.armar_cuit(em_cuit) cuit, em_nombre empresa, art.utiles.armar_cuit(tj_cuil) cuil  ' +
            ' FROM art.sex_expedientes, sle_liquiempsin, art.scp_conpago, ' +
                 ' aem_empresa, ctj_trabajador ' +
           ' WHERE ex_id = art.siniestro.get_idexpediente(le_siniestro, le_orden, le_recaida) ' +
             ' AND le_conpago = cp_conpago ' +
             ' AND le_fechahas = TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE, -1))) ' +
             ' AND NVL(le_estado, '' '') IN(''C'', ''M'', ''E'', ''P'', ''V'') ' +
             ' AND le_fproceso > TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE, -2))) ' +
             ' AND NOT EXISTS(SELECT 1 ' +
                              ' FROM SIN.scl_casosliqautomaticas ' +
                             ' WHERE cl_idexpediente = art.siniestro.get_idexpediente(le_siniestro, le_orden, le_recaida) ' +
                               ' AND cl_conpago = le_conpago) ' +
             ' AND ex_cuit = em_cuit ' +
             ' AND ex_cuil = tj_cuil ' +
             ' AND NVL(ex_causafin, '' '') NOT IN (''02'', ''99'', ''95'') ' +
             ' AND art.siniestro.get_motivocierre(ex_id) IS NULL ' +
             ' AND le_conpago  ' + cmbConceptoSug.InSql +
        ' ORDER BY ex_id ';
    sdqSugerencias.SQL.Text := sSql;
    sdqSugerencias.Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.MnuImpGrillaClick(Sender: TObject);
var
  TotalImporte: Array of Extended;
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) then
  begin
    SetLength(TotalImporte, 1);
    SumFields(dgLiqAut.DataSource.DataSet, ['CL_IMPORTEGENERADO'], TotalImporte);
    with QueryPrint do
    begin
      SubTitle.Lines.Text := 'Fecha impresión: ' + DateToStr(DBDate) +
                             ' - Cantidad de casos: ' + IntToStr(sdqLiqAut.RecordCount) +
                             ' - Importe generado: ' + FloatToStr(TotalImporte[0]);
      Print;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.mnuImpLiquidacionClick(Sender: TObject);
var
  i, iCant: Integer;
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) and (dgLiqAut.SelectedRows.Count > 0) then
  begin
    iCant := GetCantSel(['4'], True); //generado
    Verificar((iCant = 0), Nil, 'No se ha seleccionado ningún caso en condiciones de imprimir la liquidación.');
    if MsgAsk('Se ha/n seleccionado ' + IntToStr(iCant) + ' caso/s en condiciones de imprimir, ' + #13 +
              '¿Confirma la impresión de las liquidaciones correspondientes?') and
       (fpImprimirLiq.ShowModal = mrOk) then
    with sdqLiqAut do
    try
      for i := 0 to dgLiqAut.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(dgLiqAut.SelectedRows.Items[i]));
        if (FieldByName('cl_estado').AsString = '4') and
           (FieldByName('cl_fechaimpresion').IsNull or
           (not(FieldByName('cl_fechaimpresion').IsNull) and Seguridad.Claves.IsActive('ReimprimirLiq')))
        then
          DoImprimirLiquidacion(FieldByName('cl_id').AsInteger, FieldByName('ex_siniestro').AsInteger,
                               FieldByName('ex_orden').AsInteger, FieldByName('ex_recaida').AsInteger,
                               FieldByName('cl_nroliquidacion').AsInteger, FieldByName('cl_conpago').AsInteger,
                               FieldByName('cl_tipoliq').AsString, edCantRec.Value, edCantRes.Value, edCantDig.Value);
      end;
      sdqLiqAut.Refresh;
      dgLiqAut.UnselectAll;
    except
      on E:Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al intentar imprimir.');
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.DoImprimirLiquidacion(iIdCaso, iSiniestro, iOrden, iRecaida,
                                                   iNroLiq, iConcepto: Integer; sTipoLiq: String;
                                                   iCantRec, iCantLiq, iCantDig: Integer);
var
  sSql: String;
begin

  if (IntToStr(iConcepto) = CONCEPTO_MUERTE_ANTICIPO) then
   DoImprimirLiqMortal(iSiniestro, iOrden, iRecaida)
  else begin
    DoLiberarLiquidacion(oLiqui);
    if (sTipoLiq = 'L') then //si estamos en ILT
      oLiqui := TILT.Create(iSiniestro, iOrden, iRecaida, iNroLiq, True, True,
                            True, True, True, True, True, True)
    else //si estamos en ILP
      oLiqui := TILP.Create(iSiniestro, iOrden, iRecaida, iNroLiq, True, True);

    oLiqui.Imprimir(iCantRec, iCantLiq, iCantDig, False);

    if (oLiqui.NumPagoComi > 0) then
    begin
      if (iCantLiq > 0) then
        with TqrLiqOtrosConceptos.Create(nil) do
          try
            Preparar(iSiniestro, iOrden, iRecaida, oLiqui.NumPagoComi, iCantLiq, '', srPrint);
          finally
            Free;
          end;

      if (iCantRec > 0) then
        with TqrReciboOtrosConceptos.Create(nil) do
        try
          Preparar(iSiniestro, iOrden, iRecaida, oLiqui.NumPagoComi, iCantRec, srPrint);
        finally
          Free;
        end;
    end;
  end;

  sSql := 'UPDATE SIN.scl_casosliqautomaticas ' +
            ' SET cl_fechaimpresion = art.actualdate, ' +
                ' cl_usuimpresion = :Usuario ' +
        ' WHERE cl_id = :ID ';
  EjecutarSqlEx(sSql, [Sesion.UserID, iIdCaso]);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbFechaCierreClick(Sender: TObject);
var
  sSql: String;
begin
  if fpFechaCierre.ShowModal = mrOk then
  begin
    sSql := 'UPDATE sin.scl_casosliqautomaticas ' +
              ' SET cl_fechabaja = ' + SqlDate(edFechaCierre.Date) +
            ' WHERE cl_id = 0 ';
    EjecutarSql(sSql);
    pnlCierre.Caption := 'Cierre actual: ' + edFechaCierre.Text;
    dCierre           := edFechaCierre.Date
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.fpFechaCierreBeforeShow(Sender: TObject);
begin
  edFechaCierre.Date := dCierre;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnAceptarFechaClick(Sender: TObject);
begin
  Verificar(edFechaCierre.IsEmpty, edFechaCierre, 'Debe ingresar la fecha.');
  Verificar(edFechaCierre.Date < DBDate, edFechaCierre, 'La fecha no puede ser anterior a la actual.');
  Verificar(edFechaCierre.Date > LastDayOfMonth(DBDate), edFechaCierre, 'La fecha no puede ser superior al último día del mes.');
  fpFechaCierre.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.sdqLiqAutAfterOpen(DataSet: TDataSet);
begin
  if sdqLiqAut.FieldByName('CL_IMPORTEGENERADO') is TFloatField then
    TFloatField(sdqLiqAut.FieldByName('CL_IMPORTEGENERADO')).Currency := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnImprimirSugClick(Sender: TObject);
begin
  if sdqSugerenciasBaja.Active and not(sdqSugerenciasBaja.IsEmpty) then
    qpSugBaja.Print;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnRefrescarBajaClick(Sender: TObject);
var
  sSql: String;
begin
  sdqSugerenciasBaja.Close;
  if (cmbConceptoBaja.Text <> '') then
  begin
    sSql := ' SELECT * FROM v_sbl_sugerenciasbajaliqaut ' +
             ' WHERE bl_conpago ' + cmbConceptoBaja.InSql;
    sdqSugerenciasBaja.SQL.Text := sSql; 
    sdqSugerenciasBaja.Open;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnImprimirAltaClick(Sender: TObject);
begin
  if sdqSugerencias.Active and not(sdqSugerencias.IsEmpty) then
    qpSugAlta.Print;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbBloqAsigFamClick(Sender: TObject);
begin
  DoBloquearAsigFam(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.DoBloquearAsigFam(bBloquear: Boolean);
var
  i: Integer;
  sSql: String;
begin
  if sdqLiqAut.Active and not(sdqLiqAut.IsEmpty) and (dgLiqAut.SelectedRows.Count > 0) and
     ((bBloquear and MsgAsk('¿Confirma el BLOQUEO de asignaciones familiares para los ' + IntToStr(dgLiqAut.SelectedRows.Count) + ' casos seleccionados?')) or
      (not(bBloquear) and MsgAsk('¿Confirma el DESBLOQUEO de asignaciones familiares para los ' + IntToStr(dgLiqAut.SelectedRows.Count) + ' casos seleccionados?'))) then
    with sdqLiqAut do
    try
      BeginTrans;
      for i := 0 to dgLiqAut.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(dgLiqAut.SelectedRows.Items[i]));
        sSql := 'UPDATE sin.scl_casosliqautomaticas ' +
                  ' SET cl_bloquearasigfam = ' + String(IIF(bBloquear, '''S''', '''N''')) + ',' +
                      ' cl_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                      ' cl_fechamodif = ActualDate ' +
                ' WHERE cl_id = ' + SqlInt(FieldByName('cl_id').AsInteger);
        EjecutarSqlST(sSql);
      end;
      CommitTrans;
      sdqLiqAut.Refresh;
      dgLiqAut.UnselectAll;
    except
      on E:Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al intentar bloquear/desbloquear.');
      end;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.tbHabilitarAsigFamClick(Sender: TObject);
begin
  DoBloquearAsigFam(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.btnAceptarImpClick(Sender: TObject);
begin
  Verificar((edCantRes.Value = 0) and (edCantRec.Value = 0),
             gbCantCopias, 'Ambas cantidades no pueden ser 0.');
  fpImprimirLiq.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.DoGenerarLiqMortal(iSiniestro, iOrden, iRecaida, iConcepto, iIdCaso: Integer);
var
  sSql, sObser, sCampo, sMonto: String;
  dDesde, dHasta: TDate;
  iEstado: Integer;
  cMontoLiq: Currency;
begin
  dDesde := FirstLastDayOfMonth(DBDate);
  dHasta := LastDayOfMonth(DBDate);

  with TSDStoredProc.Create(nil) do
  try
    DatabaseName   := 'dbPrincipal';
    StoredProcName := 'art.liq.do_generarliqmortal';
    Params.CreateParam(ftInteger, 'psiniestro', ptInput);
    Params.CreateParam(ftInteger, 'porden',     ptInput);
    Params.CreateParam(ftInteger, 'precaida',   ptInput);
    Params.CreateParam(ftInteger, 'pconcepto',  ptInput);
    Params.CreateParam(ftDate,    'pdesde',     ptInput);
    Params.CreateParam(ftDate,    'phasta',     ptInput);
    Params.CreateParam(ftString,  'perror',     ptOutput);
    Params.CreateParam(ftFloat,   'pmontoliq',  ptOutput);

    ParamByName('psiniestro').Value  := iSiniestro;
    ParamByName('porden').Value      := iOrden;
    ParamByName('precaida').Value    := iRecaida;
    ParamByName('pconcepto').Value   := iConcepto;
    ParamByName('pdesde').Value      := dDesde;
    ParamByName('phasta').Value      := dHasta;

    try
      ExecProc;
    except
      on E: Exception do
      begin
        ErrorMsg(E, 'Error al intentar generar la liquidación de siniestro mortal.');
        Exit;
      end;
    end;

    sObser    := ParamByName('perror').AsString;
    cMontoLiq := ParamByName('pmontoliq').AsFloat;
  finally
    Free;
  end;

  if (sObser <> '') then
  begin
    iEstado := 5;
    sCampo  := 'cl_fechamodif';
  end
  else begin
    iEstado := 4;
    sCampo  := 'cl_fechageneracion';
    sMonto  := 'cl_importegenerado = ' + SqlNumber(cMontoLiq) + ',';
  end;

  sSql := 'UPDATE SIN.scl_casosliqautomaticas ' +
            ' SET cl_estado = :Estado, ' +
                 sCampo + ' = art.actualdate, ' + sMonto +
              ' cl_usumodif = :Usuario, ' +
              ' cl_observaciones = :Obs ' +
        ' WHERE cl_id = :ID ';
  EjecutarSqlSTEx(sSql, [iEstado, Sesion.UserID, sObser, iIdCaso]);

end;
{-------------------------------------------------------------------------------}
procedure TfrmLiqAutomaticas.DoImprimirLiqMortal(iSiniestro, iOrden, iRecaida :Integer);
var
  sSql: String;
  dDesde, dHasta: TDate;
begin
  dDesde := FirstLastDayOfMonth(DBDate);
  dHasta := LastDayOfMonth(DBDate);
  sSql   := 'SELECT DISTINCT bl_numliq, eb_replegal, eb_grupofamiliar, le_conpago ' +
             ' FROM seb_beneficiarios, sle_liquiempsin, sbl_beneficiarioliquidacion ' +
            ' WHERE le_siniestro = eb_siniestro ' +
              ' AND le_orden = eb_orden ' +
              ' AND le_recaida = eb_recaida ' +
              ' AND eb_siniestro = bl_siniestro ' +
              ' AND eb_orden = bl_orden ' +
              ' AND eb_recaida = bl_recaida ' +
              ' AND bl_numliq = le_numliqui ' +
              ' AND bl_beneficiario = eb_codigo ' +
              ' AND le_siniestro = :Sin ' +
              ' AND le_orden = :Ord ' +
              ' AND le_recaida = :Reca ' +
              ' AND le_fechades = :Desde ' +
              ' AND le_fechahas = :Hasta ' +
              ' AND le_usualta = ''AUTOMATICO''  ' +
              ' AND NVL(le_estado, '''') IN (''C'',''M'',''E'',''P'',''V'') ' +
              ' AND le_tipoliqui NOT IN (''W'',''X'',''Y'',''Z'') ' +
         ' ORDER BY bl_numliq';
  with GetQueryEx(sSql, [iSiniestro, iOrden, iRecaida, TDateTimeEx.Create(dDesde),
                         TDateTimeEx.Create(dHasta)]) do
  try
    while not Eof do
    begin
      DoImprimirMortal(iSiniestro, iOrden, iRecaida,
                       FieldByName('bl_numliq').AsInteger,
                       FieldByName('le_conpago').AsInteger, 2,
                       FieldByName('eb_grupofamiliar').AsInteger,
                       (FieldByName('eb_replegal').AsString = 'S'));
      Next;
    end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmLiqAutomaticas.GetNombreTrabCTJ(iIdExpediente: Integer): string;    // TK 47963
begin
  Result := ValorSqlEx(' SELECT tj_nombre FROM ctj_trabajador, art.sex_expedientes ' +
                        ' WHERE tj_id = ex_idtrabajador ' +
                          ' AND ex_id = :idexped', [iIdExpediente]);
end;

end.
