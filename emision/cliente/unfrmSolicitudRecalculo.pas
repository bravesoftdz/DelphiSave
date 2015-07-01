unit unfrmSolicitudRecalculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, DBClient, DBCtrls, Periodos,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, JvExComCtrls,
  JvComponent, JvDBDotNetControls, CustomDlgs, AnsiSql, unDmPrincipal,
  unSesion, SqlFuncs, unfuncionesemision, Mask, ToolEdit, DateComboBox,
  Strfuncs, unfrmRecalculoDevengado, General;

type
  TfrmPedidosRecalculo = class(TfrmCustomGridABM)
    fraEmpresa: TfraEmpresa;
    lblCUIT: TLabel;
    lblPeriodosSolicitud: TLabel;
    ppPeriodoDesde: TPeriodoPicker;
    lblHastaPeriodos: TLabel;
    ppPeriodoHasta: TPeriodoPicker;
    tbComandosDetalle: TToolBar;
    tbAdd: TToolButton;
    tbDelete: TToolButton;
    tbLimpiarNomina: TToolButton;
    ToolButton1: TToolButton;
    cdsPeriodos: TClientDataSet;
    dsPeriodos: TDataSource;
    fraMotivo: TfraCodigoDescripcionExt;
    Label1: TLabel;
    edObservacion: TMemo;
    Label2: TLabel;
    cdsPeriodosPeriodo: TStringField;
    lstPeriodos: TListBox;
    Panel1: TPanel;
    lblReferenciaSolicitudCumplida: TLabel;
    pnColorSolicitudCumplida: TPanel;
    fraEmpresaFiltro: TfraEmpresa;
    lblEmpresa: TLabel;
    lblPeriodosFiltro: TLabel;
    lblHastaPeriodosFiltro: TLabel;
    ppPeriodosHastaFiltro: TPeriodoPicker;
    lblFechaDesdeFiltro: TLabel;
    edFechaDesde: TDateComboBox;
    lblFechaHastaFIltro: TLabel;
    edFechaHasta: TDateComboBox;
    GroupBox1: TGroupBox;
    chkAutorizadas: TCheckBox;
    chkSinAutorizar: TCheckBox;
    ppPeriodosDesdeFiltro: TPeriodoPicker;
    lblMotivo: TLabel;
    fraMotivoFiltro: TfraCodigoDescripcionExt;
    fraSolicitante: TfraCodigoDescripcionExt;
    Label3: TLabel;
    chkExcluirBajas: TCheckBox;
    cdsPeriodosTipoCumplimiento: TStringField;
    lblPedidoSinPeriodo: TLabel;
    procedure tbAddClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbDeleteClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure AgregarPeriodos;
    procedure tbLimpiarNominaClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
    procedure RefrescarListBox;
    function GetFiltro: string;
    function GetPrimerPeriodoaRecalcular(cdsaRecalcular: TDataSet): String;
    function GetUltimoPeriodoaRecalcular(cdsaRecalcular: TDataSet): String;
  public
    procedure AgregarPeriodosPedido(aidpedido: integer);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmPedidosRecalculo: TfrmPedidosRecalculo;

implementation

uses unCustomConsulta, unArt;

{$R *.dfm}

procedure TfrmPedidosRecalculo.tbAddClick(Sender: TObject);
var
  aPeriodo: String;
begin
  if (ppPeriodoDesde.Periodo.Valor = '') or
     (ppPeriodoHasta.Periodo.Valor = '') then Exit;

  aPeriodo := ppPeriodoDesde.Periodo.Valor;
  while (aPeriodo <= ppPeriodoHasta.Periodo.Valor) do
  begin
    try
      cdsPeriodos.Append;
      cdsPeriodos.FieldByName('Periodo').AsString := aPeriodo;
      cdsPeriodos.Post;
    except
      cdsPeriodos.Cancel;
    end;
    aPeriodo := NextPeriodo(aPeriodo);
  end;
  RefrescarListBox;
end;

procedure TfrmPedidosRecalculo.fpAbmShow(Sender: TObject);
begin
  inherited;
  lblPedidoSinPeriodo.Visible := (ModoABM = maModificacion) and (sdqConsulta.FieldByName('sa_id').IsNull);
end;

procedure TfrmPedidosRecalculo.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'emi.ipr_pedidorecalculo';
  FieldBaja     := 'pr_fechabaja';

  fraMotivo.TableName := 'emi.imp_motivopedidorecalculo';
  fraMotivo.FieldCodigo := 'mp_id';
  fraMotivo.FieldID := 'mp_id';
  fraMotivo.FieldDesc := 'mp_descripcion';
  fraMotivo.FieldBaja := 'mp_fechabaja';
  fraMotivo.ShowBajas := false;

  fraMotivoFiltro.TableName := 'emi.imp_motivopedidorecalculo';
  fraMotivoFiltro.FieldCodigo := 'mp_id';
  fraMotivoFiltro.FieldID := 'mp_id';
  fraMotivoFiltro.FieldDesc := 'mp_descripcion';
  fraMotivoFiltro.FieldBaja := 'mp_fechabaja';
  fraMotivoFiltro.ShowBajas := false;

  with fraSolicitante do
  begin
    TableName := 'art.use_usuarios';
    FieldID := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc := 'se_nombre';
    FieldBaja := 'se_fechabaja';
  end;

  fraEmpresa.ShowBajas := true;
  fraEmpresaFiltro.ShowBajas := true;

  cdsPeriodos.Open;
end;

procedure TfrmPedidosRecalculo.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  fraMotivo.Clear;
  fraSolicitante.Clear;
  fraSolicitante.Codigo := Sesion.LoginName;
  edObservacion.Clear;
  ppPeriodoDesde.Clear;
  ppPeriodoHasta.Clear;
  lstPeriodos.Clear;
  if cdsPeriodos.Active then
    cdsPeriodos.EmptyDataSet;
  LockControl(fpAbm, false);
end;

function TfrmPedidosRecalculo.DoABM: Boolean;
var
  idautorizacion, idpedido: integer;
  periododesde, periodohasta: String;
begin
  idautorizacion := ART_EMPTY_ID;
  idpedido       := ART_EMPTY_ID;

  Sql.Clear;

  btnAceptar.Enabled := false;
  btnCancelar.Enabled := false;
  try

    BeginTrans(true);
    try
      if ModoABM = maBaja Then
      begin
        Sql.PrimaryKey.Add('PR_ID', sdqConsulta.FieldByName('PR_ID').AsInteger );
        Sql.Fields.Add('PR_USUBAJA', Sesion.LoginName );
        Sql.Fields.Add('PR_FECHABAJA', exDateTime );
        Sql.SqlType := stUpdate;
      end else begin
        Sql.Fields.Add('PR_OBSERVACION', edObservacion.Text);
        Sql.Fields.Add('PR_IDMOTIVOPEDIDO', fraMotivo.Value);
        Sql.Fields.Add('PR_SOLICITANTE', fraSolicitante.Value);
        Sql.Fields.Add('PR_CONTRATO', fraEmpresa.Contrato);

        cdsPeriodos.First;
        periododesde := cdsPeriodos.fieldbyname('Periodo').AsString;
        cdsPeriodos.Last;
        periodohasta := cdsPeriodos.fieldbyname('Periodo').AsString;

        with TfrmPedidoRecalculoDev.Create(self) do
        try
          FormStyle := fsNormal;
          Visible := false;
          Contrato := self.fraEmpresa.Contrato;
          CargarSolicitud;
          periododesde := GetPrimerPeriodoaRecalcular(cdsConsulta);
          periodohasta := GetUltimoPeriodoaRecalcular(cdsConsulta);
  //        regarecalcular := not cdsConsulta.IsEmpty;
        finally
          Delay(300);
          free;
        end;

        if (periododesde = '') then
        begin
          Rollback(true);
          MsgBox ('No existe nada para recalcular en estos períodos.');
          Result := False;
          Exit;
        end;

        idautorizacion := get_autorizacionrecalculo(fraEmpresa.Contrato, periododesde, periodohasta);

        Sql.Fields.Add('PR_IDSOLICITUDAUTORIZACION', idautorizacion);

        if ModoABM = maAlta Then begin
          idpedido := GetSecNextVal('EMI.SEQ_IPE_ID');
          Sql.PrimaryKey.Add('PR_ID', idpedido);
          Sql.Fields.Add('PR_USUALTA', Sesion.LoginName );
          Sql.Fields.Add('PR_FECHAALTA', exDateTime );
        end else begin
          idpedido := sdqConsulta.FieldByName('PR_ID').AsInteger;
          Sql.PrimaryKey.Add('PR_ID', sdqConsulta.FieldByName('PR_ID').AsInteger);
          Sql.Fields.Add('PR_USUBAJA', exNull );
          Sql.Fields.Add('PR_FECHABAJA', exNull );
          Sql.Fields.Add('PR_USUMODIF', Sesion.LoginName );
          Sql.Fields.Add('PR_FECHAMODIF', exDateTime );
        end;
      end;


      Result := inherited DoABM;

      if ModoABM <> maBaja then
        AgregarPeriodosPedido(idpedido);

      if (((ModoABM = maBaja) or
         ((ModoABM = maModificacion) and (sdqConsulta.FieldByName('PR_IDSOLICITUDAUTORIZACION').AsInteger <> idautorizacion)))
         and (not ExisteSql(' select 1 ' +
                            ' from emi.ipr_pedidorecalculo ' +
                            ' where pr_id <> ' + SqlValue(sdqConsulta.FieldByName('PR_ID').AsInteger) +  ' and pr_fechabaja is null ' +
                            ' and pr_idsolicitudautorizacion = ' + SqlValue(sdqConsulta.FieldByName('PR_IDSOLICITUDAUTORIZACION').AsInteger)))) then
      begin
        EjecutarSqlST(' UPDATE emi.isa_solicitudautorizacion ' +
                      ' SET sa_fechacumplimiento = sysdate, ' +
                      ' sa_tipocumplimiento = ''E'',' +
                      ' sa_usuariocumplimiento = ' + SqlValue(Sesion.LoginName) +
                      ' WHERE sa_id = ' + SqlValue(sdqConsulta.FieldByName('PR_IDSOLICITUDAUTORIZACION').AsInteger)
                      );
        do_actualizarEstadoPeriodos(sdqConsulta.FieldByName('PR_IDSOLICITUDAUTORIZACION').AsInteger, fraEmpresa.Contrato);
      end;

      CommitTrans(true);
      if sdqConsulta.Active then
        tbRefrescarClick(nil);
    except
      on E : Exception do
      begin
        Rollback(true);
        MsgBox('Error al generar el pedido.' + #13#10 +  E.Message, MB_ICONERROR or MB_OK, 'Pedido de Recálculo');
        Result := False;
      end;
    end;
  finally
    btnAceptar.Enabled := true;
    btnCancelar.Enabled := true;
  end;
end;

procedure TfrmPedidosRecalculo.LoadControls;
begin
  inherited;
  fraEmpresa.Contrato := sdqConsulta.fieldbyname('pr_contrato').AsInteger;
  edObservacion.Text := sdqConsulta.fieldbyname('pr_observacion').AsString;
  fraMotivo.Value := sdqConsulta.fieldbyname('pr_idmotivopedido').AsInteger;
  fraSolicitante.Value := sdqConsulta.fieldbyname('pr_solicitante').AsInteger;
  AgregarPeriodos;
  RefrescarListBox;
  if not sdqConsulta.FieldByName('SA_FECHACUMPLIMIENTO').IsNull then
  begin
    LockControl(fpAbm, true);
    btnCancelar.Enabled := true;
    lstPeriodos.Enabled := true;
  end
  else
    LockControl(fpAbm, false);

  LockControl(fraEmpresa, true);
end;

function TfrmPedidosRecalculo.Validar: Boolean;
begin
  Verificar(not fraEmpresa.IsSelected, fraEmpresa, 'Debe seleccionar una empresa.');
  Verificar(not fraSolicitante.IsSelected, fraSolicitante, 'Debe seleccionar el solicitante.');
  Verificar(not fraMotivo.IsSelected, fraMotivo, 'Debe seleccionar un motivo.');
  Verificar(lstPeriodos.Items.Count = 0, lstPeriodos, 'Debe seleccionar algún período.');

  Result := true;
end;

procedure TfrmPedidosRecalculo.RefrescarListBox;
begin
  lstPeriodos.Items.Clear;
  cdsPeriodos.First;
  while not cdsPeriodos.Eof do
  begin
    lstPeriodos.Items.Add(cdsPeriodos.FieldbyName('periodo').AsString + iif(cdsPeriodos.FieldbyName('TipoCumplimiento').AsString <> '',
                                                                            ' - ' + getdescripciontipocumplimiento(cdsPeriodos.FieldbyName('TipoCumplimiento').AsString),
                                                                            ''));
    cdsPeriodos.Next;
  end;
end;

procedure TfrmPedidosRecalculo.tbDeleteClick(Sender: TObject);
var
  aPeriodo: String;
begin
  if (ppPeriodoDesde.Periodo.Valor = '') or
     (ppPeriodoHasta.Periodo.Valor = '') then Exit;
     
  aPeriodo := ppPeriodoDesde.Periodo.Valor;
  while (aPeriodo <= ppPeriodoHasta.Periodo.Valor) do
  begin
    cdsPeriodos.SetKey;
    cdsPeriodos.FieldByName('Periodo').AsString := aPeriodo;
    if cdsPeriodos.GotoKey then
    begin
      cdsPeriodos.Delete;
    end;
    aPeriodo := NextPeriodo(aPeriodo);
  end;
  RefrescarListBox;
end;

procedure TfrmPedidosRecalculo.fpAbmClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsPeriodos.EmptyDataSet;
//  cdsPeriodos.Close;
end;

procedure TfrmPedidosRecalculo.AgregarPeriodos;
var
  Query : TSDQuery;
  sSql  : String;
begin
//  cdsPeriodos.Open;
  sSql := 'SELECT distinct pp_periodo, sp_tipocumplimiento' +
          ' FROM EMI.IPP_PEDIDORECALCULOPERIODO, EMI.ISP_SOLICITUDAUTORIZPERIODO ' +
          ' WHERE SP_IDSOLICITUDAUTORIZACION(+) = ' + SqlValue(sdqConsulta.fieldbyname('sa_id').AsInteger) + 
          ' AND SP_PERIODO(+) = PP_PERIODO ' +
          ' AND PP_IDPEDIDORECALCULO = ' + SqlValue(sdqConsulta.fieldbyname('pr_id').AsInteger);
  Query := GetQuery( sSql);
  try
    while not Query.Eof do
    begin
      cdsPeriodos.Append;
      cdsPeriodos.FieldByName('Periodo').AsString := Query.fieldbyname('pp_periodo').AsString;
      cdsPeriodos.FieldByName('TipoCumplimiento').AsString := Query.fieldbyname('sp_tipocumplimiento').AsString;
      cdsPeriodos.Post;
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmPedidosRecalculo.tbLimpiarNominaClick(Sender: TObject);
begin
  if cdsPeriodos.Active then
    cdsPeriodos.EmptyDataSet;
  RefrescarListBox;
end;

procedure TfrmPedidosRecalculo.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text := GetFiltro;
  inherited;
end;

function TfrmPedidosRecalculo.GetFiltro : string;
var
 sFrom : string;
 sWhere : string;
 sSql : string;
begin
  sWhere := '';

  if fraEmpresaFiltro.IsSelected then
  begin
    sWhere := sWhere + ' and PR_CONTRATO = ' + SqlValue(fraEmpresaFiltro.Contrato);
  end;

  if not IsEmptyString(ppPeriodosDesdeFiltro.Text)  then
  begin
     if not IsEmptyString(ppPeriodosHastaFiltro.Text) then
     begin
       sWhere := sWhere +  ' AND EXISTS (                                            ' +
                  '           SELECT 1                                      ' +
                  '             FROM emi.isp_solicitudautorizperiodo        ' +
                  '            WHERE sp_idsolicitudautorizacion = sa_id     ' +
                  '              AND (sp_periodo >= '+ SqlValue(ppPeriodosDesdeFiltro.Text)   +
                  '              AND  sp_periodo <= '+ SqlValue(ppPeriodosHastaFiltro.Text)   +  '))';
     end else
     begin

       sWhere := sWhere +  ' AND EXISTS (                                            ' +
                  '           SELECT 1                                      ' +
                  '             FROM emi.isp_solicitudautorizperiodo        ' +
                  '            WHERE sp_idsolicitudautorizacion = sa_id     ' +
                  '              AND sp_periodo = '+ SqlValue(ppPeriodosDesdeFiltro.Text)   +  ')';
     end;
  end;

  if edFechaDesde.Date > 0  then
  begin
     if edFechaHasta.Date > 0  then
     begin
       sWhere := sWhere + ' and TRUNC(PR_FECHAALTA) between '
               + SqlDate(edFechaDesde.Date) + 'and '
               + SqlDate(edFechaHasta.Date);
     end else
     begin
       sWhere := sWhere + ' and TRUNC(PR_FECHAALTA) >= ' + SqlDate(edFechaDesde.Date);
     end;
  end else
  begin
    if edFechaHasta.Date > 0  then
       sWhere := sWhere + ' and TRUNC(PR_FECHAALTA) <= ' + SqlDate(edFechaHasta.Date);
  end;

  if chkAutorizadas.Checked then
    sWhere := sWhere + ' and sa_tipocumplimiento <> ''E''';

  if chkSinAutorizar.Checked then
  begin
    if chkExcluirBajas.Checked then
      sWhere := sWhere + 'and sa_tipocumplimiento is null and pr_fechabaja is null '
    else
      sWhere := sWhere + ' and (sa_tipocumplimiento is null  or '
                       + ' sa_tipocumplimiento = ' + SqlValue('E') + ') ';
  end;
(*
  if chkAutorizadas.Checked then
    sWhere := sWhere + ' and sa_fechacumplimiento is not null ';

  if chkSinAutorizar.Checked then
    sWhere := sWhere + ' and sa_fechacumplimiento is null ';
*)

//  if chkDerivadas.Checked then
//    sWhere := sWhere + ' and sa_idautorizacionrelacionada is not null ';

  if fraMotivoFiltro.IsSelected then
    sWhere := sWhere + ' and pr_idmotivopedido = ' + SqlValue(fraMotivoFiltro.Value);

    sSql := ' SELECT ipr.*,                                     ' +
            '       ipr.pr_contrato,                            ' +
            '       aem.em_nombre,                              ' +
            '       isa.sa_fechacumplimiento,                   ' +
            '       isa.sa_tipocumplimiento,                   ' +
            '       isa.sa_observacion,                         ' +
            '       mp_descripcion,                             ' +
            '       isa.sa_id,                                  ' +
            '       ta_prioridad,                               ' +
            '       se_usuario,                                 ' +
            '       se_nombre,                                  ' +
            '       isa.sa_usuariocumplimiento,                 ' +
            '       decode(isa.sa_tipocumplimiento,             ' +
            '       ''A'', ''Aprobada'',                            ' +
            '       ''N'', ''No Aprobada'',                         ' +
            '       ''D'', ''Derivada'',                            ' +
            '       ''E'', ''Eliminada'',                           ' +
            '       ''M'', ''Mixto'',                               ' +
            '       ''Pendiente'') Estado,                          ' +
            '       pr_fechaalta,                                   ' +
            '       pr_usualta                                      ' +
            ' FROM emi.ipr_pedidorecalculo ipr,                 ' +
            '       emi.isa_solicitudautorizacion isa,          ' +
            '       afi.aco_contrato aco,                       ' +
            '       afi.aem_empresa aem,                        ' +
            '       emi.imp_motivopedidorecalculo imp,          ' +
            '       emi.ita_tipoautorizacion ita,               ' +
            '       art.use_usuarios                            ' +
              sFrom                                               +
            ' WHERE (    (aco.co_contrato = ipr.pr_contrato)    ' +
            '        AND (aem.em_id = aco.co_idempresa)         ' +
            '        AND (ita.ta_id(+) = isa.sa_idtipoautorizacion)' +
            '        AND (ipr.pr_idsolicitudautorizacion = sa_id(+)) ' +
            '        AND (ipr.pr_idmotivopedido = imp.mp_id))     ' +
            '        AND (se_id = pr_solicitante) ' +
            sWhere;
  result := sSql;
end;

procedure TfrmPedidosRecalculo.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqConsulta.FieldByName('sa_tipocumplimiento').IsNull) and
     (sdqConsulta.FieldByName('sa_tipocumplimiento').asstring <> 'E') then
  begin     
    if HighLight then Background := clTeal else Background := $00E1FFFF;
  end;
  inherited;
end;

procedure TfrmPedidosRecalculo.tbEliminarClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('SA_FECHACUMPLIMIENTO').IsNull then
  begin
    MsgBox('El pedido no se puede eliminar porque ya se tomó una acción sobre él.', MB_ICONERROR or MB_OK, 'Pedido de Recálculo');
    Exit;
  end;
  inherited;
end;

procedure TfrmPedidosRecalculo.tbPropiedadesClick(Sender: TObject);
begin
  if not sdqConsulta.FieldByName('SA_FECHACUMPLIMIENTO').IsNull then
  begin
    MsgBox('El pedido no se puede aprobar porque ya se tomó una acción sobre él.', MB_ICONERROR or MB_OK, 'Pedido de Recálculo');
    Exit;
  end;

  if (sdqConsulta.FieldByName('ta_prioridad').AsInteger >
      get_prioridadautorizperiodo(sdqConsulta.FieldByName('sa_id').AsInteger)) then
  begin
    MessageDlg('El existe una solicitud con mayor prioridad de autorización para el contrato.', mtError, [mbOK], 0);
    exit;
  end;

  with TfrmPedidoRecalculoDev.Create(self) do
  try
    FormStyle := fsNormal;
    Visible := false;
    Contrato := self.sdqConsulta.FieldByName('PR_contrato').AsInteger;
    CargarSolicitud;
    SolicitudAutorizacion := self.sdqConsulta.FieldByName('sa_id').AsInteger;
    ShowModal;
  finally
    free;
  end;
  if sdqConsulta.Active then
    tbRefrescarClick(Sender);
end;


function TfrmPedidosRecalculo.GetPrimerPeriodoaRecalcular(
  cdsaRecalcular: TDataSet): String;
begin
  result := '';
  cdsaRecalcular.First;
  if not cdsaRecalcular.IsEmpty then
    result := cdsaRecalcular.FieldByName('RC_PERIODO').AsString;
(*
  result := '';
  cdsPeriodos.First;
  while not cdsPeriodos.Eof do
  begin
    cdsaRecalcular.First;
    while not cdsaRecalcular.Eof and (cdsaRecalcular.FieldByName('RC_PERIODO').AsString <> cdsPeriodos.FieldByName('Periodo').AsString) do
      cdsaRecalcular.Next;
    if not cdsaRecalcular.Eof then
    begin
      Result := cdsaRecalcular.FieldByName('RC_PERIODO').AsString;
      Exit;
    end;
    cdsPeriodos.Next;
  end;
*)
end;

function TfrmPedidosRecalculo.GetUltimoPeriodoaRecalcular(
  cdsaRecalcular: TDataSet): String;
begin
  result := '';
  cdsaRecalcular.Last;
  if not cdsaRecalcular.IsEmpty then
    result := cdsaRecalcular.FieldByName('RC_PERIODO').AsString;

(*
  result := '';
  cdsPeriodos.Last;
  while not cdsPeriodos.Bof do
  begin
    cdsaRecalcular.Last;
    while not cdsaRecalcular.Bof and (cdsaRecalcular.FieldByName('RC_PERIODO').AsString <> cdsPeriodos.FieldByName('Periodo').AsString) do
      cdsaRecalcular.Prior;
    if not cdsaRecalcular.Bof then
    begin
      Result := cdsaRecalcular.FieldByName('RC_PERIODO').AsString;
      Exit;
    end;
    cdsPeriodos.Prior;
  end;
*)
end;

procedure TfrmPedidosRecalculo.AgregarPeriodosPedido(aidpedido: integer);
begin
  EjecutarSqlST('delete from emi.ipp_pedidorecalculoperiodo where pp_idpedidorecalculo = ' + SqlValue(aidpedido));

  cdsPeriodos.First;
  while not cdsPeriodos.Eof do
  begin
    EjecutarSqlST(' insert into emi.ipp_pedidorecalculoperiodo(PP_ID, PP_IDPEDIDORECALCULO, PP_PERIODO) ' +
                  ' values (emi.seq_ipp_id.nextval, ' + SqlValue(aidpedido) + ', ' + SqlValue(cdsPeriodos.FieldbyName('periodo').AsString) + ')' );   
    cdsPeriodos.Next;
  end;

end;

end.


