unit unSeguimientoCasosLiquidar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, Mask, ToolEdit, DateComboBox, CheckPanel, SinEdit,
  GroupCheckBox, FormPanel, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmSeguimientoCasosLiquidar = class(TfrmCustomConsulta)
    chkFechaSin: TCheckPanel;
    Label1: TLabel;
    dcCargaDesde: TDateComboBox;
    dcCargaHasta: TDateComboBox;
    chkFechaAccid: TCheckPanel;
    Label2: TLabel;
    dcAccidDesde: TDateComboBox;
    dcAccidHasta: TDateComboBox;
    fpAcciones: TFormPanel;
    BevelAbm: TBevel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    GroupBox4: TGroupBox;
    edSinABM: TSinEdit;
    Label4: TLabel;
    edObservacionesABM: TMemo;
    Label3: TLabel;
    chkTipoCaso: TCheckPanel;
    fraOrigen: TfraCodDesc;
    chkAccion: TCheckPanel;
    rbAccionSi: TRadioButton;
    rbAccionNo: TRadioButton;
    rbAccionTodos: TRadioButton;
    chkFechaCaso: TCheckPanel;
    Label5: TLabel;
    dcCasoDesde: TDateComboBox;
    dcCasoHasta: TDateComboBox;
    chkAccionRealizada: TCheckPanel;
    chkEmpresa: TCheckPanel;
    fraEmpresa: TfraEmpresa;
    fraAccionRealizada: TfraCodDesc;
    Label6: TLabel;
    edAccionesABM: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    fpAlta: TFormPanel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    btnAceptarAlta: TButton;
    btnCancelarAlta: TButton;
    edObservacionesAlta: TMemo;
    fraOrigenAlta: TfraCodDesc;
    fraAccionABM: TfraCodDesc;
    fraOrigenABM: TfraCodDesc;
    Label11: TLabel;
    edSinAlta: TSinEdit;
    lblTrabajador: TLabel;
    chkCorresponde: TCheckPanel;
    rbActivoSi: TRadioButton;
    rbActivoNo: TRadioButton;
    rbActivoTodos: TRadioButton;
    ShortCutControl1: TShortCutControl;
    chkTipoEmpresa: TCheckPanel;
    rbSussSi: TRadioButton;
    rbSussNo: TRadioButton;
    rbSussTodas: TRadioButton;
    edGTrabajo: TEdit;
    Label12: TLabel;
    chkSiniestro: TCheckPanel;
    edSiniestro: TSinEdit;
    tbCantRegistros: TToolButton;
    tbSalir2: TToolButton;
    tbSepTotal: TToolButton;
    pnlTotal: TPanel;
    ToolButton1: TToolButton;
    chkAltaManual: TCheckPanel;
    rbManualSi: TRadioButton;
    rbManualNo: TRadioButton;
    rbManualTodos: TRadioButton;
    qpOrigen1: TQueryPrint;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpAccionesBeforeShow(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarAltaClick(Sender: TObject);
    procedure edSinAltaSelect(Sender: TObject);
    procedure fpAltaBeforeShow(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure fraOrigenPropiedadesChange(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;
      var AText: String; var AFont: TFont; var ABackground: TColor;
      var AAlignment: TAlignment);
    procedure chkSiniestroChange(Sender: TObject);
    procedure chkTipoCasoChange(Sender: TObject);
    procedure chkAccionRealizadaChange(Sender: TObject);
    procedure chkTipoEmpresaChange(Sender: TObject);
    procedure chkEmpresaChange(Sender: TObject);
    procedure chkFechaCasoChange(Sender: TObject);
    procedure chkFechaSinChange(Sender: TObject);
    procedure chkFechaAccidChange(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbCantRegistrosClick(Sender: TObject);
    procedure chkAltaManualChange(Sender: TObject);
  private
    function HayRegistroActivo: Boolean;
    procedure SetTotal;
  public
    { Public declarations }
  end;

var
  frmSeguimientoCasosLiquidar: TfrmSeguimientoCasosLiquidar;

implementation

uses CustomDlgs, AnsiSql, General, unDmPrincipal, unSesion, Math,
  unComunes;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbRefrescarClick(Sender: TObject);
var
  sSql, sOut1, sOut2, sOut4 :String;
  bAuto: Boolean;
begin
  Verificar(fraOrigen.IsEmpty, fraOrigen.edCodigo, 'Debe seleccionar un origen del caso.');

  bAuto := IIF(fraOrigen.sdqDatos.FieldByName('oc_automatico').AsString = 'S', True, False);
  sOut1 := IIF(bAuto, '(+)', '');
  sOut2 := IIF(bAuto, '', '(+)');
  sOut4 := IIF(fraOrigen.Value = 1, '', '(+)');
  sSql  := ' SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                  ' art.utiles.armar_cuit(ex_cuil) cuil, art.utiles.armar_cuit(ex_cuit) cuit, ' +
                  ' em_nombre, DECODE(em_suss, 1, ''SUSS'', 2, ''No SUSS'', 3, ''Mixto'') tipoemp,  ' +
                  ' tj_nombre, ex_fechaaccidente, ex_fecharecaida, ex_bajamedica, ' +
                  ' ex_altamedica, ex_fechaalta, est.tb_descripcion estado,  ' +
                  ' TRUNC(cl_fechaalta) fechaingreso, oc_descripcion tipo, ' +
                  ' art.dinerarias.get_isaccionrealizada(cl_id) accionrealizada, ' +
                  ' art.dinerarias.get_accionesrealizadas(cl_id) acciones, ' +
                  ' ex_id, cl_corresponde, cl_id, ex_siniestro, ex_orden, ex_recaida, ' +
                  ' cl_observaciones, cl_fechabaja, em_suss, TRUNC(hl_fechaalta) fbaja, ' +
                  ' TRUNC(hl_fechaegreso) hl_fechaegreso, motb.tb_descripcion motivobaja, ' +
                  ' ev_fecha, ev_fechaalta, comi.tb_descripcion comision, ' +
                  ' ev_expedincapacidad, ev_fecharecepcion, cl_altamanual, TRUNC(cl_fechaalta) cl_fechaalta ' +
             ' FROM ctb_tablas est, ctb_tablas motb, ctb_tablas comi, aem_empresa, ' +
                  ' ctj_trabajador, sex_expedientes, sin.spd_empresaspagodirecto, ' +
                  ' sin.scl_seguimientocasosliquidar,  sin.soc_origencasosdocum, ' +
                  ' comunes.chl_historicolaboral, sev_eventosdetramite ' +
            ' WHERE ex_cuil = tj_cuil ' +
              ' AND ex_cuit = em_cuit ' +
              ' AND ex_cuit = pd_cuit' +  sOut1 +
              ' AND pd_fechabaja ' + sOut1 + 'IS NULL ' +
              ' AND ex_id = cl_idexpediente' + sOut2 +
              ' AND cl_idbajatrabajador = hl_id(+) ' +
              ' AND cl_ideventoconti = ev_idevento' + sOut4 +
              ' AND NVL(cl_idorigen, 4) = oc_id' + sOut2 +
              ' AND NVL(ex_causafin, ''0'') NOT IN(''99'', ''95'') ' +
              ' AND est.tb_clave(+) = ''SIEST'' ' +
              ' AND est.tb_codigo(+) = ex_estado ' +
              ' AND motb.tb_clave(+) = ''MOTIB'' ' +
              ' AND motb.tb_codigo(+) = hl_motivobaja ' +
              ' AND comi.tb_clave(+) = ''COMED'' ' +
              ' AND comi.tb_codigo(+) = ev_comision ' +
              ' AND cl_idorigen ' + sOut2 + '= ' + SqlInt(fraOrigen.Value);

  if not bAuto then //estos son los casos de las empresas que tienen pago directo
    sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                                 ' FROM aco_contrato ' +
                                ' WHERE co_contrato = ex_contrato ' +
                                  ' AND NVL(co_diasfranquicia, 0) < NVL(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_orden), ' +
                                                                      ' co_diasfranquicia + 1) ' +
                                  ' AND ex_fechaaccidente > (TRUNC(SysDate) - 365))';


  if chkFechaCaso.Checked then
    sSql := sSql + ' AND TRUNC(cl_fechaalta) BETWEEN ' + SqlDate(dcCasoDesde.Date) +
                                               ' AND ' + SqlDate(dcCasoHasta.Date);
  if chkFechaSin.Checked then
    sSql := sSql + ' AND ex_fechaalta BETWEEN ' + SqlDate(dcCargaDesde.Date) +
                                        ' AND ' + SqlDate(dcCargaHasta.Date);

  if chkFechaAccid.Checked then
    sSql := sSql + ' AND ex_fechaaccidente BETWEEN ' + SqlDate(dcAccidDesde.Date) +
                                             ' AND ' + SqlDate(dcAccidHasta.Date);

  if chkEmpresa.Checked then
    sSql := sSql + ' AND ex_cuit = ' + SqlValue(fraEmpresa.CUIT);

  if chkAccion.Checked and not(rbAccionTodos.Checked) then
    sSql := sSql + ' AND art.dinerarias.get_isaccionrealizada(cl_id) = ' + SqlBoolean(IIF(rbAccionSi.Checked, True, False));

  if chkCorresponde.Checked and not(rbActivoTodos.Checked) then
    sSql := sSql + ' AND NVL(cl_corresponde, ''S'') = ' + SqlBoolean(IIF(rbActivoSi.Checked, True, False));

  if chkAccionRealizada.Checked then
    sSql := sSql + ' AND EXISTS (SELECT 1 ' +
                                 ' FROM sin.sar_accionesrealizadas ' +
                                ' WHERE ar_idcaso = cl_id ' +
                                  ' AND ar_idaccion = ' + SqlInt(fraAccionRealizada.Value) +
                                  ' AND ar_fechabaja IS NULL) ';

  if chkTipoEmpresa.Checked and not(rbSussTodas.Checked) then
    sSql := sSql + ' AND em_suss = ' + SqlInt(Integer(IIF(rbSussSi.Checked, 1, 2)));

  if not edSiniestro.IsEmpty then
    sSql := sSql + ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida);

  if chkAltaManual.Checked and not(rbManualTodos.Checked) then
    sSql := sSql + ' AND cl_altamanual = ' + SqlBoolean(IIF(rbManualSi.Checked, True, False));

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  inherited;
  SetTotal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.FormCreate(Sender: TObject);
begin
  inherited;
  with fraEmpresa do
  begin
    ShowBajas      := True;
    UltContrato    := True;
    ExtraCondition := ' AND em_cuit IN (SELECT pd_cuit  ' +
                                        ' FROM sin.spd_empresaspagodirecto ' +
                                       ' WHERE pd_fechabaja IS NULL) ';
    MinLength      := 0;
  end;
  fraAccionRealizada.Propiedades.ExtraCondition := ' AND td_idorigen = 0 ';
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbModificarClick(Sender: TObject);
var
  sSql: String;
  iIdCaso: Integer;
begin
  if HayRegistroActivo and (fpAcciones.ShowModal = mrOk) then
  try
    BeginTrans;
    if sdqConsulta.FieldByName('cl_id').IsNull then
    begin
      iIdCaso := GetSecNextVal('art.seq_caso_id');
      sSql    := 'INSERT INTO sin.scl_seguimientocasosliquidar ' +
                 '(cl_id, cl_idexpediente, cl_idorigen, cl_observaciones, ' +
                 ' cl_usualta, cl_fechaalta, cl_altamanual) VALUES (' +
                 SqlInt(iIdCaso) + ',' + SqlInt(sdqConsulta.FieldByName('ex_id').AsInteger) + ',' +
                 SqlInt(fraOrigenABM.Value) + ',' +  SqlValue(edObservacionesABM.Lines.Text) + ',' +
                 SqlValue(Sesion.UserID) + ', sysdate, ''S'')';
      EjecutarSqlST(sSql);
    end
    else begin
      iIdCaso := sdqConsulta.FieldByName('cl_id').AsInteger;
      sSql    := 'UPDATE sin.scl_seguimientocasosliquidar ' +
                   ' SET cl_observaciones = ' + SqlValue(edObservacionesABM.Lines.Text) + ',' +
                       ' cl_fechamodif = ActualDate, ' +
                       ' cl_usumodif = ' + SqlValue(Sesion.UserID) +
                 ' WHERE cl_id = ' + SqlInt(iIdCaso);
      EjecutarSqlST(sSql);
    end;

    sSql := 'INSERT INTO sin.sar_accionesrealizadas ' +
            '(ar_idcaso, ar_idaccion, ar_usualta, ar_fechaalta) VALUES (' +
            SqlInt(iIdCaso) + ',' + SqlInt(fraAccionABM.Value) + ',' +
            SqlValue(Sesion.UserID) + ', sysdate)';
    EjecutarSqlST(sSql);

    CommitTrans;
    if sdqConsulta.Active then tbRefrescarClick(Nil);
  except
    on E:Exception do
    begin
       Rollback;
       ErrorMsg(E, 'Error al intentar generar la acción.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraOrigenABM.IsEmpty, fraOrigenABM, 'Debe seleccionar el orígen del caso.');
  fpAcciones.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
function TfrmSeguimientoCasosLiquidar.HayRegistroActivo: Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty) and
            sdqConsulta.FieldByName('cl_fechabaja').IsNull;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.fpAccionesBeforeShow(Sender: TObject);
var
  Siniestro, Orden, Recaida: Integer;
begin
  Siniestro := sdqConsulta.FieldByName('ex_siniestro').AsInteger;
  Orden     := sdqConsulta.FieldByName('ex_orden').AsInteger;
  Recaida   := sdqConsulta.FieldByName('ex_recaida').AsInteger;

  edSinABM.SetValues(Siniestro, Orden, Recaida);
  edGTrabajo.Text := ValorSqlEx('SELECT gp_nombre || DECODE(ex_gestor, Null, Null, '' (Gestor: '' || ex_gestor || '')'') ' +
                                 ' FROM sex_expedientes, mgp_gtrabajo ' +
                                ' WHERE ex_gtrabajo = gp_codigo ' +
                                  ' AND ex_siniestro = :Sin ' +
                                  ' AND ex_orden = :Ord ' +
                                  ' AND ex_recaida = :Reca', [Siniestro, Orden, Recaida]);
  fraOrigenABM.Value                      := fraOrigen.Value;
  edAccionesABM.Lines.Text                := sdqConsulta.FieldByName('acciones').AsString;
  fraAccionABM.Propiedades.ExtraCondition := ' AND td_idorigen = ' + SqlInt(fraOrigenABM.Value);
  edObservacionesABM.Lines.Text           := sdqConsulta.FieldByName('cl_observaciones').AsString;
  fraAccionABM.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbNuevoClick(Sender: TObject);
var
  sSql: String;
  iIdExp: Integer;
begin
  if (fpAlta.ShowModal = mrOk) then
  begin
    iIdExp  := ValorSqlIntegerEx('SELECT ex_id ' +
                                  ' FROM sex_expedientes ' +
                                 ' WHERE ex_siniestro = :Sin ' +
                                   ' AND ex_orden = :Ord ' +
                                   ' AND ex_recaida = :Reca', [edSinAlta.Siniestro,
                                                               edSinAlta.Orden,
                                                               edSinAlta.Recaida]);
    sSql    := 'INSERT INTO sin.scl_seguimientocasosliquidar ' +
               '(cl_id, cl_idexpediente, cl_idorigen, cl_observaciones, ' +
               ' cl_usualta, cl_fechaalta, cl_altamanual) VALUES (' +
               ' art.seq_caso_id.NEXTVAL, ' + SqlInt(iIdExp) + ',' +
               SqlInt(fraOrigenAlta.Value) + ',' +  SqlValue(edObservacionesAlta.Lines.Text) + ',' +
               SqlValue(Sesion.UserID) + ', sysdate, ''S'')';
    EjecutarSql(sSql);
    if sdqConsulta.Active then tbRefrescarClick(Nil);
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.btnAceptarAltaClick(Sender: TObject);
var
  sSql: String;
  iIdExped: Integer;
begin
  Verificar(edSinAlta.IsEmpty, edSinAlta, 'Debe ingresar el siniestro.');
  Verificar(fraOrigenAlta.IsEmpty, fraOrigenAlta.edCodigo, 'Debe seleccionar el origen del caso.');

  iIdExped := Get_IdExpediente(edSinAlta.Siniestro, edSinAlta.Orden, edSinAlta.Recaida);
  sSql := 'SELECT 1 ' +
           ' FROM sex_expedientes, sin.spd_empresaspagodirecto ' +
          ' WHERE ex_cuit = pd_cuit ' +
            ' AND pd_fechabaja IS NULL ' +
            ' AND ex_id = :idex';
  if (fraOrigenAlta.sdqDatos.FieldByName('oc_automatico').AsString = 'N') then
  begin
    Verificar(not(ExisteSqlEx(sSql, [iIdExped])), edSinAlta,
              'El siniestro seleccionado no pertenece a una empresa que posee pago directo.');
    sSql := 'SELECT ex_fechaaccidente ' +
             ' FROM art.sex_expedientes ' +
            ' WHERE ex_id = :idex';
    Verificar((ValorSqlDateTimeEx(sSql, [iIdExped]) < (DBDate - 365)), edSinAlta,
              'El siniestro seleccionado supera el año de accidente.');
    sSql := 'SELECT 1 ' +
             ' FROM aco_contrato, sex_expedientes ' +
            ' WHERE co_contrato = ex_contrato ' +
              ' AND NVL(co_diasfranquicia, 0) < NVL(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_orden), ' +
                                                  ' co_diasfranquicia + 1) ' +
              ' AND ex_id = :idex ';
    Verificar(not(ExisteSqlEx(sSql, [iIdExped])), edSinAlta,
              'Los días de baja del siniestro seleccionado no superan la franquicia.');
  end;
  sSql := 'SELECT ex_gravedad ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_id = :idex ';
  Verificar((fraOrigenAlta.Value = 3) and (ValorSqlEx(sSql, [iIdExped]) <> '5'),
            edSinAlta, 'El siniestro seleccionado no es mortal.');
  sSql := 'SELECT 1 ' +
           ' FROM sin.scl_seguimientocasosliquidar ' +
          ' WHERE cl_idexpediente = :idex ' +
            ' AND cl_idorigen = :idorigen ' +
            ' AND cl_fechabaja IS NULL';
  Verificar(ExisteSqlEx(sSql, [iIdExped, fraOrigenAlta.Value]),
            edSinAlta, 'El caso ya existe para el mismo orígen.');

  fpAlta.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.edSinAltaSelect(Sender: TObject);
var
  sTrab: String;
begin
  sTrab := ValorSqlEx('SELECT tj_nombre ' +
                       ' FROM sex_expedientes, ctj_trabajador ' +
                      ' WHERE ex_idtrabajador = tj_id ' +
                        ' AND NVL(ex_causafin, '' '') NOT IN (''99'', ''95'') ' +
                        ' AND ex_siniestro = :Sin ' +
                        ' AND ex_orden = :Ord ' +
                        ' AND ex_recaida = :Reca', [edSinAlta.Siniestro, edSinAlta.Orden, edSinAlta.Recaida]);
  if (Trim(sTrab) = '') then
  begin
    edSinAlta.Clear;
    Verificar(True, edSinAlta, 'No existe el siniestro buscado. Verifique los datos ingresados.');
  end
  else
    lblTrabajador.Caption := sTrab;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.fpAltaBeforeShow(Sender: TObject);
begin
  lblTrabajador.Caption := '';
  edSinAlta.Clear;
  fraOrigenAlta.Clear;
  edObservacionesAlta.Lines.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  iIdCaso: Integer;
begin
  if HayRegistroActivo and MsgAsk('¿Confirma eliminar el caso seleccionado?') then
  try
    BeginTrans;
    if sdqConsulta.FieldByName('cl_id').IsNull then
    begin
      iIdCaso := GetSecNextVal('art.seq_caso_id');
      sSql    := 'INSERT INTO sin.scl_seguimientocasosliquidar ' +
                 '(cl_id, cl_idexpediente, cl_idorigen, cl_usualta, ' +
                 ' cl_fechaalta, cl_altamanual) VALUES (' +
                 SqlInt(iIdCaso) + ',' + SqlInt(sdqConsulta.FieldByName('ex_id').AsInteger) + ',' +
                 SqlInt(fraOrigen.Value) + ',' + SqlValue(Sesion.UserID) +
                 ', sysdate, ''S'')';
      EjecutarSqlST(sSql);
    end
    else
      iIdCaso := sdqConsulta.FieldByname('cl_id').AsInteger;

    sSql := 'UPDATE sin.scl_seguimientocasosliquidar ' +
              ' SET cl_corresponde = ''N'', ' +
                  ' cl_fechabaja = ActualDate, ' +
                  ' cl_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE cl_id = ' + SqlInt(iIdCaso);
    EjecutarSqlST(sSql);
    CommitTrans;
    tbRefrescarClick(Nil);
  except
    on E:Exception do
    begin
       Rollback;
       ErrorMsg(E, 'Error al intentar generar la acción.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not(sdqConsulta.FieldByName('cl_fechabaja').IsNull) then
    AFont.Color := clRed;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbImprimirClick(Sender: TObject);
begin
  if (fraOrigen.Value = 1) then
  begin
    qpOrigen1.SubTitle.Lines.Clear;
    qpOrigen1.SubTitle.Lines.Add('Casos con el origen: ' + fraOrigen.Descripcion);
    qpOrigen1.SubTitle.Lines.Add('');
    qpOrigen1.Footer.Text := Sesion.Usuario;
    qpOrigen1.Print;
  end
  else begin
    if (fraOrigen.Value = 2) then
    begin
      QueryPrint.Fields[4].DataField := 'FBAJA';
      QueryPrint.Fields[4].Title     := 'F. proceso baja';
      QueryPrint.Fields[4].Width     := 0;
      QueryPrint.Fields[5].DataField := 'HL_FECHAEGRESO';
      QueryPrint.Fields[5].Title     := 'F. egreso trab.';
      QueryPrint.Fields[5].Width     := 0;
    end;
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.SubTitle.Lines.Add('Casos con el origen: ' + fraOrigen.Descripcion);
    QueryPrint.SubTitle.Lines.Add('');
    QueryPrint.Footer.Text := Sesion.Usuario;
    inherited;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  chkAccionRealizada.Checked  := False;
  chkFechaCaso.Checked        := False;
  chkFechaSin.Checked         := False;
  chkFechaAccid.Checked       := False;
  chkEmpresa.Checked          := False;
  chkTipoEmpresa.Checked      := False;
  chkSiniestro.Checked        := False;
  chkAltaManual.Checked       := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.fraOrigenPropiedadesChange(Sender: TObject);
begin
  inherited;
  fraAccionRealizada.Clear;
  fraAccionRealizada.Propiedades.ExtraCondition := ' AND td_idorigen = ' + SqlInt(fraOrigen.Value);
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.QueryPrintGetCellParams(
  Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
  var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;
  if not sdqConsulta.FieldByName('cl_fechabaja').IsNull then
    AFont.Style := [fsStrikeOut];
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkSiniestroChange(Sender: TObject);
begin
  inherited;
  edSiniestro.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkTipoCasoChange(Sender: TObject);
begin
  inherited;
  fraOrigen.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkAccionRealizadaChange(Sender: TObject);
begin
  inherited;
  fraAccionRealizada.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkTipoEmpresaChange(Sender: TObject);
begin
  inherited;
  rbSussTodas.Checked := True;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkEmpresaChange(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkFechaCasoChange(Sender: TObject);
begin
  inherited;
  dcCasoDesde.Clear;
  dcCasoHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkFechaSinChange(Sender: TObject);
begin
  inherited;
  dcCargaDesde.Clear;
  dcCargaHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkFechaAccidChange(Sender: TObject);
begin
  inherited;
  dcAccidDesde.Clear;
  dcAccidHasta.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbSalir2Click(Sender: TObject);
begin
  inherited;
  Close;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.tbCantRegistrosClick(Sender: TObject);
begin
  SetTotal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.SetTotal;
begin
  if sdqConsulta.Active and tbCantRegistros.Down then
  begin
    pnlTotal.Caption    := ' Cantidad de casos: ' + IntToStr(sdqConsulta.RecordCount);
    tbSepTotal.Visible  := True;
  end
  else begin
    pnlTotal.Caption    := '';
    tbSepTotal.Visible  := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmSeguimientoCasosLiquidar.chkAltaManualChange(Sender: TObject);
begin
  inherited;
  rbManualTodos.Checked := True;
end;
{-------------------------------------------------------------------------------}
end.
