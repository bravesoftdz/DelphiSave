unit unConsultaPlanesPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, SinEdit, unArt, CurrEdit, IntEdit,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, RxCurrEdit, RxToolEdit,
  RxPlacemnt;

type
  TfrmConsultaPlanesPago = class(TfrmCustomGridABM)
    gbFecha: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    gbEmpresa: TGroupBox;
    fraEmpresaBusq: TfraEmpresa;
    gbEstado: TGroupBox;
    cmbEstados: TDBCheckCombo;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    plnActivos: TPanel;
    chkSoloActivos: TCheckBox;
    ShortCutControl1: TShortCutControl;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    tbConvertirA: TToolButton;
    edSiniestroAlta: TSinEdit;
    Label2: TLabel;
    edFechaAlta: TDateComboBox;
    Label3: TLabel;
    edImporteAlta: TCurrencyEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    fraEmpresaDeudoraBusq: TfraEmpresa;
    Label5: TLabel;
    fraEmprDeudoraAlta: TfraEmpresa;
    GroupBox2: TGroupBox;
    edPlanBusq: TIntEdit;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    GroupBox3: TGroupBox;
    cmbConceptos: TDBCheckCombo;
    sdqConceptos: TSDQuery;
    dsConceptos: TDataSource;
    fraConceptoAlta: TfraStaticCTB_TABLAS;
    Label6: TLabel;
    ToolButton9: TToolButton;
    tbCancelar: TToolButton;
    ToolButton7: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbConvertirAClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure edSiniestroAltaExit(Sender: TObject);
    procedure edSiniestroAltaEnter(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    pIdPlan: TTableId;
    piSiniestro, piOrden: Integer;
    procedure DoCargarPlan(IdPlan: String);
    procedure DoMostrarExisteSiniestroPlan(Siniestro, Orden: Integer);
    procedure DoCancelarPlan(IdPlan: TTableId);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
  public
    procedure RefreshData; override;
  end;

var
  frmConsultaPlanesPago: TfrmConsultaPlanesPago;

implementation

uses
  CustomDlgs, AnsiSql, General, unDmPrincipal, SqlFuncs, unSesion, unCargaCuotasLeg,
  unLegales, StrFuncs;

{$R *.dfm}

procedure TfrmConsultaPlanesPago.RefreshData;
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT XP_ID PLAN, XP_FECHA FECHA, ESPLA.TB_DESCRIPCION ESTADO, RS_SINIESTRO SINIESTRO, ' +
                 'RS_ORDEN ORDEN, EM_CUIT CUIT, EM_NOMBRE EMPRESA, CO_CONTRATO CONTRATO, TJ_CUIL CUIL, ' +
                 'TJ_NOMBRE TRABAJADOR, TRUNC(XP_FECHABAJA) FECHA_BAJA, ESPLA.TB_ESPECIAL2 TIPOPLANCONVENIO, ' +
                 'ED_CUIT CUITDEUDORA, ED_NOMBRE EMPRESADEUDORA, CONC.TB_DESCRIPCION DESCRCONCEPTO, ' +
                 'XP_ESTADO CODESTADO ' +
            'FROM RED_EMPDEUDORA, AEM_EMPRESA, ACO_CONTRATO, CTJ_TRABAJADOR, SEX_EXPEDIENTES, CTB_TABLAS ESPLA, ' +
                 'CTB_TABLAS CONC, LXP_RECUPEROPLAN, LRS_RECUPEROSINIESTROS ' +
           'WHERE RS_ID = XP_IDRECUPEROSINIESTRO ' +
             'AND TJ_ID = EX_IDTRABAJADOR ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND CO_CONTRATO = EX_CONTRATO ' +
             'AND EX_SINIESTRO = RS_SINIESTRO ' +
             'AND EX_ORDEN = RS_ORDEN ' +
             'AND EX_RECAIDA = 0 ' +
             'AND ESPLA.TB_CODIGO = XP_ESTADO ' +
             'AND ESPLA.TB_CLAVE = ''ESPLR'' ' +
             'AND CONC.TB_CODIGO = XP_CONCEPTO ' +
             'AND CONC.TB_CLAVE = ''LCPRS'' ' +
             'AND XP_IDEMPDEUDORA = ED_ID';

  sWhere := SqlBetweenDateTime(' AND XP_FECHA ', edFechaDesde.Date, edFechaHasta.Date);

  if not fraEmpresaBusq.IsEmpty then
    sWhere := sWhere + ' AND CO_CONTRATO = ' + SqlValue(fraEmpresaBusq.Contrato);

  if not fraEmpresaDeudoraBusq.IsEmpty then
    sWhere := sWhere + ' AND XP_IDEMPDEUDORA  = ' + SqlValue(fraEmpresaDeudoraBusq.Value);

  if cmbEstados.Text <> '' then
    sWhere := sWhere + ' AND XP_ESTADO ' + cmbEstados.InSql;

  if cmbConceptos.Text <> '' then
    sWhere := sWhere + ' AND XP_CONCEPTO ' + cmbConceptos.InSql;

  if not edSiniestro.IsEmpty then
    sWhere := sWhere + ' AND RS_SINIESTRO = ' + SqlValue(edSiniestro.Siniestro) +
                       ' AND RS_ORDEN = ' + SqlValue(edSiniestro.Orden);

  if edPlanBusq.Value <> 0 then
    sWhere := sWhere + ' AND XP_ID = ' + IntToStr(edPlanBusq.Value);

  if chkSoloActivos.Checked then
    sWhere := sWhere + ' AND XP_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmConsultaPlanesPago.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived   := False;
  Sql.TableName := 'LXP_RECUPEROPLAN';
  FieldBaja     := 'FECHA_BAJA';

  sdqEstados.Open;
  sdqConceptos.Open;

  fraEmpresaBusq.ShowBajas := True;

  with fraEmpresaDeudoraBusq do
    begin
      Sql :=
        'SELECT ED_ID AS '           + EMP_ALIAS_ID                 + ', ' +
               'ED_CUIT AS '         + EMP_ALIAS_CUIT               + ', ' +
               'ED_NOMBRE AS '       + EMP_ALIAS_NOMBRE             + ', ' +
               'NULL AS '            + EMP_ALIAS_CONTRATO           + ', ' +
               'NULL AS '            + EMP_ALIAS_CODREG             + ', ' +
               'TO_NUMBER(NULL) AS ' + EMP_ALIAS_CONTRATOEXT        + ', ' +
               'TO_NUMBER(NULL) AS ' + EMP_ALIAS_IDTIPOREGIMEN_ORIG + ', ' +
               'ED_FECHABAJA AS '    + EMP_ALIAS_BAJA               + ', ' +
               'NULL '               + EMP_ALIAS_VIP                + ', ' +
               'DECODE(ED_FECHABAJA, NULL, 1, 2) ' + EMP_ALIAS_COBERTURA + ', ' +
               'NULL '               + EMP_ALIAS_ORDEN              + ' ' +
          'FROM RED_EMPDEUDORA '     +
         'WHERE 1 = 1 ' ;

      FieldID     := 'ED_ID';
      FieldCUIT   := 'ED_CUIT';
      FieldNombre := 'ED_NOMBRE';
      FieldBaja   := 'ED_FECHABAJA';
      MinLength   := 0;

      ShowBajas := True;
    end;

  with fraEmprDeudoraAlta do
    begin
      Sql := fraEmpresaDeudoraBusq.Sql;

      FieldID     := fraEmpresaDeudoraBusq.FieldID;
      FieldCUIT   := fraEmpresaDeudoraBusq.FieldCUIT;
      FieldNombre := fraEmpresaDeudoraBusq.FieldNombre;
      FieldBaja   := fraEmpresaDeudoraBusq.FieldBaja;
      MinLength   := fraEmpresaDeudoraBusq.MinLength;

      ShowBajas := False;
    end;

  with fraConceptoAlta do
    begin
      Clave := 'LCPRS';

      ShowBajas := False;
    end;
end;

procedure TfrmConsultaPlanesPago.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaBusq.Clear;
  fraEmpresaDeudoraBusq.Clear;
  cmbEstados.Clear;
  cmbConceptos.Clear;
  edSiniestro.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  edPlanBusq.Clear;
  chkSoloActivos.Checked := True;
end;

function TfrmConsultaPlanesPago.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maBaja then
        begin
           SqlType := stUpdate;

           PrimaryKey.Add('XP_ID',       sdqConsulta.FieldByName('PLAN').AsInteger);
           Fields.Add('XP_FECHABAJA',    exDateTime);
           Fields.Add('XP_USUBAJA',      Sesion.UserId);
        end
      else if ModoABM = maAlta then
        begin
          SqlType := stInsert;

          pIdPlan := GetSecNextVal('SEQ_LXP_ID');

          PrimaryKey.Add('XP_ID', 	            pIdPlan);
          Fields.Add('XP_ESTADO', 	            '01');
          Fields.Add('XP_IDRECUPEROSINIESTRO',  Get_IdRecuperoSiniestro(edSiniestroAlta.Siniestro, edSiniestroAlta.Orden));
          Fields.Add('XP_FECHA', 	              edFechaAlta.Date);
          Fields.Add('XP_IMPORTE', 	            edImporteAlta.Value);
          Fields.Add('XP_IDEMPDEUDORA',         fraEmprDeudoraAlta.Value);
          Fields.Add('XP_CONCEPTO',             fraConceptoAlta.Value);
          Fields.Add('XP_USUALTA', 	            Sesion.UserId);
          Fields.Add('XP_FECHAALTA',            exDateTime);
        end;
    end;

  Result := inherited DoABM;
end;

function TfrmConsultaPlanesPago.Validar: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT RS_ID ' +
            'FROM LRS_RECUPEROSINIESTROS ' +
           'WHERE RS_SINIESTRO = :Siniestro ' +
             'AND RS_ORDEN = :Orden ' +
             'AND RS_FTERMINADO IS NULL ' +
             'AND RS_ESTADO NOT IN (''02'', ''05'', ''06'', ''07'')';

  Verificar(edSiniestroAlta.IsEmpty, edSiniestroAlta, 'El número de siniestro es obligatorio.');
  Verificar(ValorSqlIntegerEx(sSql, [edSiniestroAlta.Siniestro, edSiniestroAlta.Orden], ART_EMPTY_ID) = ART_EMPTY_ID, edSiniestroAlta, 'El número ingresado no corresponde a un siniestro a recuperar activo.');
  Verificar(edFechaAlta.IsEmpty, edFechaAlta, 'La fecha es obligatoria.');
  Verificar(edFechaAlta.Date > DBDate(), edFechaAlta, 'La fecha no puede ser mayor a la actual.');
  Verificar(edImporteAlta.Value <= 0, edImporteAlta, 'El importe debe ser mayor a 0.');
  Verificar(fraEmprDeudoraAlta.IsEmpty, fraEmprDeudoraAlta, 'El deudor es obligatorio.');
  Verificar(fraConceptoAlta.IsEmpty, fraConceptoAlta, 'El concepto es obligatorio.');

  Result := True;
end;

procedure TfrmConsultaPlanesPago.ClearControls;
begin
  edSiniestroAlta.Clear;
  edFechaAlta.Clear;
  edImporteAlta.Clear;
  fraEmprDeudoraAlta.Clear;
  fraConceptoAlta.Clear;
end;

procedure TfrmConsultaPlanesPago.tbConvertirAClick(Sender: TObject);
var
  bConvertirOk: Boolean;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');
  Verificar(sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsString <> 'A', nil, 'El registro no corresponde a un preacuerdo.');

  if MsgBox('¿Está seguro de querer convertir este preacuerdo a plan?', MB_YESNO + MB_ICONQUESTION) = ID_YES then
    begin
      bConvertirOk := Do_ConvertirPreacuerdoRec(sdqConsulta.FieldByName('PLAN').AsInteger, True, Sesion.UserID, 'P');

      if bConvertirOk then
        begin
          MsgBox('Los datos se han guardado correctamente.', MB_ICONINFORMATION);
          RefreshData;
        end;
    end;
end;

procedure TfrmConsultaPlanesPago.tbNuevoClick(Sender: TObject);
begin
  inherited;
  if OkABM then
    DoCargarPlan(IntToStr(pIdPlan));
end;

procedure TfrmConsultaPlanesPago.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');

  DoCargarPlan(sdqConsulta.FieldByName('PLAN').AsString);
end;

procedure TfrmConsultaPlanesPago.DoCargarPlan(IdPlan: String);
begin
  frmCargaCuotasLeg := TfrmCargaCuotasLeg.Create(nil);
  with frmCargaCuotasLeg do
    try
      DoCargar(IdPlan);
      ShowModal;
      RefreshData;
    finally
      Free;
    end;
end;

procedure TfrmConsultaPlanesPago.DoMostrarExisteSiniestroPlan(Siniestro, Orden: Integer);
var
  Planes, PreAcuerdos: Integer;
  sSql, Mensaje, Adicional, Adicional2: String;
begin
  if Siniestro > 0 then
    begin
      sSql := 'SELECT COUNT(*) ' +
                'FROM LRS_RECUPEROSINIESTROS, LXP_RECUPEROPLAN ' +
               'WHERE XP_IDRECUPEROSINIESTRO = RS_ID ' +
                 'AND RS_SINIESTRO = :Siniestro ' +
                 'AND RS_ORDEN = :Orden ' +
                 'AND XP_ESTADO = ''01'' ' +
                 'AND XP_FECHABAJA IS NULL';
      PreAcuerdos := ValorSqlIntegerEx(sSql, [Siniestro, Orden]);

      sSql := 'SELECT COUNT(*) ' +
                'FROM LRS_RECUPEROSINIESTROS, LXP_RECUPEROPLAN ' +
               'WHERE XP_IDRECUPEROSINIESTRO = RS_ID ' +
                 'AND RS_SINIESTRO = :Siniestro ' +
                 'AND RS_ORDEN = :Orden ' +
                 'AND XP_ESTADO IN (''02'', ''03'') ' +
                 'AND XP_FECHABAJA IS NULL';
      Planes := ValorSqlIntegerEx(sSql, [Siniestro, Orden]);

      // Ya posee preacuerdos
      Mensaje := 'El siniestro seleccionado posee actualmente' + CRLF;
      Adicional := '';
      Adicional2 := '';

      if planes = 1 then
        Adicional := Adicional + '     1 plan vigente'
      else if planes > 1 then
        Adicional := Adicional + '     ' + IntToStr(Planes) + ' planes vigentes';

      if Preacuerdos = 1 then
        Adicional2 := Adicional2 + '     1 preacuerdo'
      else if Preacuerdos > 1 then
        Adicional2 := Adicional2 + '     ' + IntToStr(Preacuerdos) + ' preacuerdos';

      if not IsEmptyString(Adicional) then
        Mensaje := Mensaje + Adicional + CRLF;

      if not IsEmptyString(Adicional2) then
        Mensaje := Mensaje + Adicional2 + CRLF;

      if not IsEmptyString(Adicional + Adicional2) then
        InfoHint(edFechaAlta, Mensaje);
    end;
end;

procedure TfrmConsultaPlanesPago.edSiniestroAltaExit(Sender: TObject);
begin
  if not edSiniestroAlta.CompareValues(piSiniestro, piOrden, 0) then
    DoMostrarExisteSiniestroPlan(edSiniestroAlta.Siniestro, edSiniestroAlta.Orden);
end;

procedure TfrmConsultaPlanesPago.edSiniestroAltaEnter(Sender: TObject);
begin
  piSiniestro := edSiniestroAlta.Siniestro;
  piOrden     := edSiniestroAlta.Orden;
end;

procedure TfrmConsultaPlanesPago.DoCancelarPlan(IdPlan: TTableId);
var
  sSql: String;
begin
  sSql := 'LEGALES.DO_CANCELARPLANPAGORECUP(:IdPlan, :Usuario);';
  EjecutarStoreStEx( sSql, [IdPlan, Sesion.UserId]);
end;

procedure TfrmConsultaPlanesPago.tbCancelarClick(Sender: TObject);
var
  sSql: string;
  IDPlanPago: integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, Grid, 'No hay registros en la grilla.');

  sSql := 'SELECT 1 ' +
            'FROM CTB_TABLAS ' +
           'WHERE TB_ESPECIAL1 = ''S'' ' +   // es modificable
             'AND TB_ESPECIAL2 <> ''A'' ' +  // no es preacuerdo
             'AND TB_CLAVE = ''ESPLR'' ' +
             'AND TB_CODIGO =' + SqlValue(sdqConsulta.FieldByName('CODESTADO').AsString);
  Verificar(not ExisteSql(sSql), nil, 'El registro no puede cancelarse.');

  if MsgBox('¿Está usted seguro de querer pasar este plan a No Cumplido?', MB_YESNO) = ID_YES then
    begin
      BeginTrans;
      try
        IDPlanPago := sdqConsulta.FieldByName('PLAN').AsInteger;

        DoCancelarPlan(IDPlanPago);

        CommitTrans;
        RefreshData;
      except
        on E: Exception do
          begin
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
            RollBack;
          end;
      end;
    end;
end;

procedure TfrmConsultaPlanesPago.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('TIPOPLANCONVENIO').AsString <> 'A', nil, 'Solo puede dar de baja preacuerdos.');
  inherited;
end;

end.

