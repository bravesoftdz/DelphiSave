unit unFrmEmpresasTipoPresentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, ExComboBox,
  unfraCodigoDescripcionExt, unFrmAdministracionNominas, JvExMask,
  JvToolEdit, unSIC;

type
  TfrmEmpresasTipoPresentacion = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaModoPresentacion: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    lblModoPresentacion: TLabel;
    fraModoPresentacion: TfraCodigoDescripcionExt;
    fpAdjuntarArchivo: TFormPanel;
    Bevel1: TBevel;
    btnAceptarArchivoSIC: TButton;
    btnCancelarArchivoSIC: TButton;
    Bevel2: TBevel;
    edArchivoSIC: TJvFilenameEdit;
    lbArchivoSIC: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure fraEmpresaModoPresentacionExit(Sender: TObject);
    procedure edPeriodoDesdeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnAceptarArchivoSICClick(Sender: TObject);
  private
    FModoPresAnterior: integer;
    FPeriodoDesdeAnt: String;
    FPeriodoHastaAnt: String;
    function ProcesarCambioModalidad(aContrato: integer; aPeriodoDesde, aPeriodoHasta: String; aModoPresNew: integer): boolean;
    function RegistrarCambioModalidad(aContrato: integer; aPeriodoDesde, aPeriodoHasta: String; aModoPresNew: integer): boolean;
    procedure RechazarDDJJxCambioPresentacion(aContrato: integer; aPeriodoDesde, aPeriodoHasta: String; aModoPresNew: integer);
    function VerDDJJAntRechazadas(aContrato: integer; aPeriodoDesde, aPeriodoHasta: String; aModoPresNew: integer): boolean;
    procedure GenerarRegistroOmisionDDJJAFIP(aContrato: integer; aPeriodoDesde, aPeriodoHasta: String);
    procedure EliminarRegistroOmisionDDJJAFIP(aContrato: integer; aPeriodoDesde, aPeriodoHasta: String);
    function AdjuntarArchivoEvento: boolean;
  public
    { Public declarations }
    procedure ValidaContratoVigente;
    function  ValidaSolapamiento: Boolean;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  end;

var
  frmEmpresasTipoPresentacion: TfrmEmpresasTipoPresentacion;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmEmpresasTipoPresentacion.ClearControls;
begin
  fraEmpresaModoPresentacion.Clear;
  fraEmpresaModoPresentacion.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  fraModoPresentacion.Clear;
  FModoPresAnterior := 0;
  FPeriodoDesdeAnt := '';
  FPeriodoHastaAnt := '';
end;

function TfrmEmpresasTipoPresentacion.DoABM: Boolean;
var
  idevento: integer;
begin
  try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      if not AdjuntarArchivoEvento then Exit;
      Sql.PrimaryKey.Add('EP_ID', sdqConsulta.FieldByName('EP_ID').AsInteger );
      Sql.Fields.Add('EP_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('EP_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EP_IDEMPRESA',fraEmpresaModoPresentacion.Value);
      Sql.Fields.Add('EP_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('EP_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);
      Sql.Fields.Add('EP_IDMODOPRESENTACION', fraModoPresentacion.Value);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('EP_ID', GetSecNextVal('EMI.SEQ_IMP_ID'));
        Sql.Fields.Add('EP_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('EP_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('EP_ID', sdqConsulta.FieldByName('EP_ID').AsInteger);
        Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EP_USUBAJA', exNull);
        Sql.Fields.Add('EP_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    if ModoABM <> maBaja then
    begin
      if ModoABM = maAlta then
      begin
        if not ProcesarCambioModalidad(fraEmpresaModoPresentacion.Contrato,
                                       edPeriodoDesde.Periodo.Valor,
                                       edPeriodoHasta.Periodo.Valor,
                                       fraModoPresentacion.Value) then
        begin
          Result := false;
          Rollback(true);
          Exit;
        end;
        do_insertarevento(111, 4, 0, idevento, Sesion.UserID, 'Evento por cambio de modo de presentación de DDJJ.', fraEmpresaModoPresentacion.Contrato);
        do_insertaradjuntoevento(idevento, edArchivoSIC.FileName, Sesion.UserID);
      end
      else begin
      //modif
        if not ProcesarCambioModalidad(fraEmpresaModoPresentacion.Contrato,
                                       edPeriodoDesde.Periodo.Valor,
                                       edPeriodoHasta.Periodo.Valor,
                                       fraModoPresentacion.Value) then
        begin
          Result := false;
          Rollback(true);
          Exit;
        end;
        //solo tomo en cuenta este caso porque es un quilombo
        //Lo mejor es reprocesar todos los periodos y analizarlos
        if (edPeriodoHasta.Periodo.Valor <> '') and (FPeriodoHastaAnt = '') then
        begin
          edPeriodoHasta.Periodo.Next;
          try
            VerDDJJAntRechazadas(fraEmpresaModoPresentacion.Contrato, edPeriodoHasta.Periodo.Valor, '299999', 0);
          finally
            edPeriodoHasta.Periodo.Previous;
          end;
        end;
        do_insertarevento(111, 4, 0, idevento, Sesion.UserID, 'Evento por cambio de modo de presentación de DDJJ.', sdqConsulta.FieldByName('co_contrato').AsInteger);
        do_insertaradjuntoevento(idevento, edArchivoSIC.FileName, Sesion.UserID);
      end;
    end
    else begin
      do_insertarevento(111, 4, 0, idevento, Sesion.UserID, 'Evento por cambio de modo de presentación de DDJJ.', sdqConsulta.FieldByName('co_contrato').AsInteger);
      do_insertaradjuntoevento(idevento, edArchivoSIC.FileName, Sesion.UserID);
      EliminarRegistroOmisionDDJJAFIP(sdqConsulta.FieldByName('co_contrato').AsInteger, sdqConsulta.FieldByName('ep_periodovigenciadesde').AsString, sdqConsulta.FieldByName('ep_periodovigenciahasta').AsString);
      VerDDJJAntRechazadas(sdqConsulta.FieldByName('co_contrato').AsInteger, sdqConsulta.FieldByName('ep_periodovigenciadesde').AsString, sdqConsulta.FieldByName('ep_periodovigenciahasta').AsString, 0);
    end;

    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el formulario.');
    end;
  end;
end;

procedure TfrmEmpresasTipoPresentacion.LoadControls;
begin
  fraEmpresaModoPresentacion.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  fraModoPresentacion.Value := sdqConsulta.FieldByName('EP_IDMODOPRESENTACION').AsInteger;
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('EP_PERIODOVIGENCIADESDE').AsString;
  FPeriodoDesdeAnt := edPeriodoDesde.Periodo.Valor;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('EP_PERIODOVIGENCIAHASTA').AsString;
  FPeriodoHastaAnt := edPeriodoHasta.Periodo.Valor;
  fraEmpresaModoPresentacion.Locked := true;
end;

function TfrmEmpresasTipoPresentacion.Validar: Boolean;
begin
  Result := VerificarMultiple([Self.Caption,
                                fraEmpresaModoPresentacion, fraEmpresaModoPresentacion.IsSelected, 'Debe especificar una empresa',
                                fraModoPresentacion, fraModoPresentacion.IsSelected, 'Debe especificar un modo de presentación',
                                edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                                btnAceptar,ValidaSolapamiento(), 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                                ]);
  Result := Result and AdjuntarArchivoEvento;
end;
function TfrmEmpresasTipoPresentacion.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.IEP_EMPRESAMODOPRESENTACION IEP, AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd   BETWEEN EP_PERIODOVIGENCIADESDE AND NVL(EP_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN EP_PERIODOVIGENCIADESDE AND NVL(EP_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  EP_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  EP_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = EP_IDEMPRESA ' +
                        '    AND EP_FECHABAJA IS NULL ' +
                        '    AND EP_IDEMPRESA = :idemp ' +
                        + iif(ModoABM = maModificacion, ' AND ep_id <> ' + SqlValue(sdqConsulta.FieldByName('EP_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaModoPresentacion.Value]
                         );
end;

procedure TfrmEmpresasTipoPresentacion.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaModoPresentacion.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaModoPresentacion.CUIT;
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaModoPresentacion.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasTipoPresentacion.fraEmpresaModoPresentacionExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasTipoPresentacion.edPeriodoDesdeExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasTipoPresentacion.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EP_FECHABAJA';
  Sql.TableName := 'EMI.IEP_EMPRESAMODOPRESENTACION';

  fraEmpresaModoPresentacion.ShowBajas:= True;

  fraEmpresaFiltro.ShowBajas:= True;

  with fraModoPresentacion do
  begin
    TableName := 'EMI.IMP_MODOPRESENTACION';
    FieldId := 'MP_ID';
    FieldCodigo := 'MP_ID';
    FieldDesc := 'MP_DESCRIPCION';
    FieldBaja := 'MP_FECHABAJA';
    ShowBajas := true;
  end;

end;

procedure TfrmEmpresasTipoPresentacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasTipoPresentacion.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT iep.ep_id, aco.co_contrato, iep.ep_periodovigenciahasta, iep.ep_periodovigenciadesde, iep.ep_fechaalta, iep.ep_usualta, ' +
                      '       iep.ep_fechabaja, iep.ep_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre, mp_descripcion, ep_idmodopresentacion ' +
                      '  FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.imp_modopresentacion, emi.iep_empresamodopresentacion iep ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '   AND (aem.em_id = iep.ep_idempresa) ' +
                      '   AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ' +
                      '   AND (mp_id = ep_idmodopresentacion) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND EP_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));
     
  inherited;
end;

function TfrmEmpresasTipoPresentacion.ProcesarCambioModalidad(
  aContrato: integer; aPeriodoDesde, aPeriodoHasta: String;
  aModoPresNew: integer): boolean;
//var
//  idevento: integer;
begin
  result := true;

  if (FModoPresAnterior = aModoPresNew) then Exit;

  if ExisteSqlEx(' SELECT 1 ' +
                 '  FROM emi.itf_tipoformulario, emi.iev_estadoverificado, emi.idj_ddjj ' +
                 ' WHERE ev_id = dj_estado ' +
                 '   AND ev_estado || '''' = ''A'' ' +
                 '   AND dj_idformulario = tf_id(+) ' +
                 '   AND tf_idmodopresentacion <> :modopres ' +
//Se saca esto porque los rns web tienen detalle y son extrasuss
//pero al eliminar esto no se rechazan automaticamente las ddjj viejas yaque se desconoce si son manuales o no
(*
                 '   AND ((tf_idmodopresentacion <> :modopres) ' +
                 '        OR ((EXISTS (SELECT 1 ' +
                 '                   FROM emi.idt_ddjjtrabajador ' +
                 '                   WHERE dt_idddjj = dj_id) OR (dj_idformulario IS NULL AND dj_empleados = 0)) AND (:modopres <> 1))) ' +
*)
                 '   AND dj_contrato = :contrato ' +
                 '   AND dj_periodo >= :periododesde ' +
                 '   AND dj_periodo <= :periodohasta ', [aModoPresNew, (*aModoPresNew,*) aContrato, aPeriodoDesde, iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')]) then
  begin
    //Si el nuevo modo de presentacion es mixto no se debe rechazar nada
    if (aModoPresNew <> MODO_PRESENTACION_MIXTO) then
    begin
      if MsgAsk('Existen DDJJ con una modalidad de presentación distinta a la seleccionada. ¿Desea rechazarlas?') then
        result := RegistrarCambioModalidad(aContrato, aPeriodoDesde, aPeriodoHasta, aModoPresNew)
      else
        result := false;
    end;
  end
  else begin
    if (aModoPresNew <> MODO_PRESENTACION_MIXTO) then
      result := RegistrarCambioModalidad(aContrato, aPeriodoDesde, aPeriodoHasta, aModoPresNew);
  end;
(*
  if result then
  begin
    do_insertarevento(111, 4, 0, idevento, Sesion.UserID, 'Evento por cambio de modo de presentación de DDJJ.', aContrato);
    do_insertaradjuntoevento(idevento, edArchivoSIC.FileName, Sesion.UserID);
  end;
*)
end;

procedure TfrmEmpresasTipoPresentacion.RechazarDDJJxCambioPresentacion(
  aContrato: integer; aPeriodoDesde, aPeriodoHasta: String; aModoPresNew: integer);
var
  sSql: String;
begin
  sSql := ' SELECT dj_id ' +
          '  FROM emi.itf_tipoformulario, emi.iev_estadoverificado, emi.idj_ddjj ' +
          ' WHERE ev_id = dj_estado ' +
          '   AND ev_estado || '''' = ''I'' ' +
          '   AND dj_idformulario = tf_id(+) ' +
          '   AND tf_idmodopresentacion <> :modopres ' +
(*
          '   AND ((tf_idmodopresentacion <> :modopres) ' +
          '        OR ((EXISTS (SELECT 1 ' +
          '                   FROM emi.idt_ddjjtrabajador ' +
          '                   WHERE dt_idddjj = dj_id) OR (dj_idformulario IS NULL AND dj_empleados = 0)) AND (:modopres <> 1))) ' +
*)
          '   AND dj_contrato = :contrato ' +
          '   AND dj_periodo >= :periododesde ' +
          '   AND dj_periodo <= :periodohasta ';
  //primero rechazo las inactivas
  with GetQueryEx(sSql, [aModoPresNew, (*aModoPresNew,*) aContrato, aPeriodoDesde, iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')]) do
  try
    while not Eof do
    begin
      EjecutarSqlST(' UPDATE emi.idj_ddjj ' +
                    '   SET dj_estado = 10 ' + //emi.utiles.estado_rechazo_manual ' +
                    '  WHERE dj_id = ' + SqlValue(FieldByName('dj_id').AsInteger));

      EjecutarSqlST(' insert into emi.ida_ddjjaceptacionrech ' +
                    ' values(emi.seq_idc_id.nextval, ' + SqlValue(FieldByName('dj_id').AsInteger) + ', ' +
                      SqlValue(81)  +  ', sysdate, ' + SqlValue(Sesion.LoginName) + ', null)' );
      do_invalidarpresentacion(FieldByName('dj_id').AsInteger);
      Next;
    end;
  finally
    free;
  end;
  sSql := ' SELECT dj_id ' +
          '  FROM emi.itf_tipoformulario, emi.iev_estadoverificado, emi.idj_ddjj ' +
          ' WHERE ev_id = dj_estado ' +
          '   AND ev_estado || '''' = ''A'' ' +
          '   AND dj_idformulario = tf_id(+) ' +
          '   AND tf_idmodopresentacion <> :modopres ' +
(*
          '   AND ((tf_idmodopresentacion <> :modopres) ' +
          '        OR ((EXISTS (SELECT 1 ' +
          '                   FROM emi.idt_ddjjtrabajador ' +
          '                   WHERE dt_idddjj = dj_id) OR (dj_idformulario IS NULL AND dj_empleados = 0)) AND (:modopres <> 1))) ' +
*)
          '   AND dj_contrato = :contrato ' +
          '   AND dj_periodo >= :periododesde ' +
          '   AND dj_periodo <= :periodohasta ' +
          ' ORDER BY dj_periodo ';

  //luego rechazo las activas
  with GetQueryEx(sSql, [aModoPresNew, (*aModoPresNew,*) aContrato, aPeriodoDesde, iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')]) do
  try
    while not Eof do
    begin
      EjecutarSqlST(' insert into emi.ida_ddjjaceptacionrech ' +
                    ' values(emi.seq_idc_id.nextval, ' + SqlValue(FieldByName('dj_id').AsInteger) + ', ' +
                      SqlValue(81)  +  ', sysdate, ' + SqlValue(Sesion.LoginName) + ', null)' );
      do_invalidarpresentacion(FieldByName('dj_id').AsInteger);
      Next;
    end;
  finally
    free;
  end;
end;

procedure TfrmEmpresasTipoPresentacion.GenerarRegistroOmisionDDJJAFIP(
  aContrato: integer; aPeriodoDesde, aPeriodoHasta: String);
var
  sSql: String;
  YaExiste: boolean;
begin
  YaExiste := false;

  sSql:= ' SELECT er_id, er_idempresa, er_empleados, er_periodovigenciadesde, nvl(er_periodovigenciahasta, ''299999'') er_periodovigenciahasta' +
         '  FROM emi.ier_empresarechazoddjj ier, afi.aem_empresa, afi.aco_contrato ' +
         ' WHERE er_idempresa = em_id ' +
         '   AND co_idempresa = em_id ' +
         '   AND er_fechabaja IS NULL ' +
         '   AND co_contrato = :contrato ';

  with GetQueryEx(sSql, [aContrato]) do
  try
    while not Eof do
    begin
      if (FieldByName('er_periodovigenciadesde').AsString <= aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString >= iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) and
         (FieldByName('er_empleados').AsString = 'T') then
         YaExiste := true;

      if (FieldByName('er_periodovigenciadesde').AsString > aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString >= iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) and
         (FieldByName('er_empleados').AsString = 'T') then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_periodovigenciadesde = :desde,  ' +
                         '     er_fechamodif = sysdate, ' +
                         '     er_usumodif = :usuario ' +
                         ' where er_id = :id ', [aPeriodoDesde, Sesion.LoginName, FieldByName('er_id').AsInteger]);
         YaExiste := true;
      end;

      if (FieldByName('er_periodovigenciadesde').AsString <= aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString < iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) and
         (FieldByName('er_empleados').AsString = 'T') then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_periodovigenciahasta = :hasta,  ' +
                         '     er_fechamodif = sysdate, ' +
                         '     er_usumodif = :usuario ' +
                         ' where er_id = :id ', [aPeriodoHasta, Sesion.LoginName, FieldByName('er_id').AsInteger]);
         YaExiste := true;
      end;

(*
      if (FieldByName('er_periodovigenciadesde').AsString < aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString <= iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) and
         (FieldByName('er_empleados').AsString = 'S') then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_periodovigenciahasta = art.utiles.periodo_anterior(:hasta),  ' +
                         '     er_fechamodif = sysdate, ' +
                         '     er_usumodif = :usuario ' +
                         ' where er_id = :id ', [aPeriodoDesde, Sesion.LoginName, FieldByName('er_id').AsInteger]);
         YaExiste := false;
         break;
      end;

      if (FieldByName('er_periodovigenciadesde').AsString >= aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString <= iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) and
         (FieldByName('er_empleados').AsString = 'S') then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_fechabaja = sysdate, ' +
                         '     er_usubaja = :usuario ' +
                         ' where er_id = :id ', [Sesion.LoginName, FieldByName('er_id').AsInteger]);
         YaExiste := false;
         break;
      end;

      if (FieldByName('er_periodovigenciadesde').AsString >= aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString > iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) and
         (FieldByName('er_empleados').AsString = 'S') then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_periodovigenciadesde = art.utiles.periodo_proximo(:desde),  ' +
                         '     er_fechamodif = sysdate, ' +
                         '     er_usumodif = :usuario ' +
                         ' where er_id = :id ', [aPeriodoHasta, Sesion.LoginName, FieldByName('er_id').AsInteger]);
         YaExiste := false;
         break;
      end;

      Falta el caso de que el registro que ingresa esta totalmente incluido en un Sin personal (S)
      en este caso insertar un registro con S con el hasta exitente en la tabla
      tambien hay que actualizar el hasta del S con un mes menos del desde del T,
      y poner la bandera de YaExidte en false

*)
      Next;
    end;
    if not YaExiste then
    begin
      EjecutarSqlSTEx(' INSERT INTO emi.ier_empresarechazoddjj ' +
                      ' (er_id, er_idempresa, er_usualta, er_fechaalta, er_periodovigenciadesde, er_periodovigenciahasta, ' +
                      '  er_empleados) ' +
                      ' VALUES (emi.seq_ier_id.NEXTVAL, :idempresa, :usuario, SYSDATE, :desde, :hasta, ' +
                      '  ''T'')', [fraEmpresaModoPresentacion.Value, Sesion.LoginName, aPeriodoDesde, aPeriodoHasta]);

    end;
  finally
    free;
  end;
end;

procedure TfrmEmpresasTipoPresentacion.EliminarRegistroOmisionDDJJAFIP(
  aContrato: integer; aPeriodoDesde, aPeriodoHasta: String);
var
  sSql: String;
begin
  sSql:= ' SELECT er_id, er_idempresa, er_periodovigenciadesde, nvl(er_periodovigenciahasta, ''299999'') er_periodovigenciahasta' +
         '  FROM emi.ier_empresarechazoddjj ier, afi.aem_empresa, afi.aco_contrato ' +
         ' WHERE er_idempresa = em_id ' +
         '   AND co_idempresa = em_id ' +
         '   AND er_fechabaja IS NULL ' +
         '   AND er_empleados = ''T'' ' +
         '   AND co_contrato = :contrato ';

  with GetQueryEx(sSql, [aContrato]) do
  try
    while not Eof do
    begin
      if (FieldByName('er_periodovigenciadesde').AsString < aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString <= iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_periodovigenciahasta = art.utiles.periodo_anterior(:hasta),  ' +
                         '     er_fechamodif = sysdate, ' +
                         '     er_usumodif = :usuario ' +
                         ' where er_id = :id ', [aPeriodoDesde, Sesion.LoginName, FieldByName('er_id').AsInteger]);
      end;

      if (FieldByName('er_periodovigenciadesde').AsString >= aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString <= iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_fechabaja = sysdate, ' +
                         '     er_usubaja = :usuario ' +
                         ' where er_id = :id ', [Sesion.LoginName, FieldByName('er_id').AsInteger]);
      end;

      if (FieldByName('er_periodovigenciadesde').AsString >= aPeriodoDesde) and
         (FieldByName('er_periodovigenciahasta').AsString > iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')) then
      begin
         EjecutarSqlSTEx(' update emi.ier_empresarechazoddjj ' +
                         ' set er_periodovigenciadesde = art.utiles.periodo_proximo(:desde),  ' +
                         '     er_fechamodif = sysdate, ' +
                         '     er_usumodif = :usuario ' +
                         ' where er_id = :id ', [aPeriodoHasta, Sesion.LoginName, FieldByName('er_id').AsInteger]);
      end;
      Next;
    end;
  finally
    free;
  end;
end;

function TfrmEmpresasTipoPresentacion.VerDDJJAntRechazadas(
  aContrato: integer; aPeriodoDesde, aPeriodoHasta: String;
  aModoPresNew: integer): boolean;
begin
  if ExisteSqlEx(' SELECT 1 ' +
                 '  FROM emi.itf_tipoformulario, emi.iev_estadoverificado, emi.idj_ddjj ' +
                 ' WHERE ev_id = dj_estado ' +
                 '   AND ev_estado || '''' in (''R'', ''M'') ' +
                 '   AND dj_idformulario = tf_id(+) ' +
                 iif(aModoPresNew <> 0, ' AND tf_idmodopresentacion = ' + SqlValue(aModoPresNew), '') +
(*
                 iif(aModoPresNew <> 0, '   AND ((tf_idmodopresentacion = :modopres) ' +
                                        '        OR ((EXISTS (SELECT 1 ' +
                                        '                   FROM emi.idt_ddjjtrabajador ' +
                                        '                   WHERE dt_idddjj = dj_id)  OR (dj_idformulario IS NULL AND dj_empleados = 0)) AND (:modopres = 1))) ', ' AND :modopres = :modopres ')  +
*)
                 '   AND dj_contrato = :contrato ' +
                 '   AND dj_periodo >= :periododesde ' +
                 '   AND dj_periodo <= :periodohasta ', [aContrato,aPeriodoDesde, iif(aPeriodoHasta<>'', aPeriodoHasta, '299999')]) then
  begin
    CommitTrans(true);
    MsgBox('Existe DDJJ rechazadas con la nueva modalidad. Utilice la siguiente pantalla para reactivar las DDJJ.', MB_ICONINFORMATION, self.Caption);
    with TfrmAdministracionNominas.Create(self) do
    try
      FormStyle := fsNormal;
      Visible := false;
      tsProcesosEmision.TabVisible := false;
      fraEmpresaPresentacion.Locked := true;
      tbLimpiar.Enabled := false;
      WindowState := wsNormal;
      fraEmpresaPresentacion.Contrato := aContrato;
      EmpresaOnchange(self);
      edtPeriodoDesde.Periodo.Valor := aPeriodoDesde;
      edtPeriodoHasta.Periodo.Valor := aPeriodoHasta;
      tbSoloPresentacionesActivas.Down := false;
      tbRefrescar.Click;
      ShowModal;
      result := true;
    finally
      free;
    end;
  end
  else
    result := true;
end;

procedure TfrmEmpresasTipoPresentacion.fpAbmShow(Sender: TObject);
begin
  inherited;
  FModoPresAnterior := fraModoPresentacion.Value;
  if (ModoABM = maModificacion) and not sdqConsulta.FieldByName('ep_fechabaja').IsNull then
    FModoPresAnterior := 0;
end;

function TfrmEmpresasTipoPresentacion.RegistrarCambioModalidad(
  aContrato: integer; aPeriodoDesde, aPeriodoHasta: String;
  aModoPresNew: integer): boolean;
begin
  result := true;
  if (aModoPresNew <> MODO_PRESENTACION_MIXTO) then
  begin
    RechazarDDJJxCambioPresentacion(aContrato, aPeriodoDesde, aPeriodoHasta, aModoPresNew);
    if (aModoPresNew <> MODO_PRESENTACION_AFIP) then
      GenerarRegistroOmisionDDJJAFIP(aContrato, aPeriodoDesde, aPeriodoHasta)
    else
      EliminarRegistroOmisionDDJJAFIP(aContrato, aPeriodoDesde, aPeriodoHasta);
    result := VerDDJJAntRechazadas(aContrato, aPeriodoDesde, aPeriodoHasta, aModoPresNew);
  end;
end;

function TfrmEmpresasTipoPresentacion.AdjuntarArchivoEvento: boolean;
begin
  edArchivoSIC.Clear;
  result := (fpAdjuntarArchivo.ShowModal = mrOk);
end;

procedure TfrmEmpresasTipoPresentacion.btnAceptarArchivoSICClick(
  Sender: TObject);
begin
  Verificar(not FileExists(edArchivoSIC.FileName), edArchivoSIC, 'Debe indicar el archivo adjunto para poder continuar.');
  fpAdjuntarArchivo.ModalResult := mrOk;
end;

end.


